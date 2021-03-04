# coding: utf-8

import math
import maya.api.OpenMaya as om
from maya import cmds as mc
from mathNode import MathNode
from Common.Functions.implement import classproperty
from Projects.Blue.Tools.ProceduralAnim.Package.Scripts import keyframeData
reload(keyframeData)
from Projects.Blue.Tools.ProceduralAnim.Package.Scripts.keyframeData import KeyframeData


class MathSpring(MathNode):
    def postConstructor(self):
        super(MathSpring, self).postConstructor()
        self.damping_start_time = -1
        self.pre_dest_rotate = om.MVector.kZeroVector
        self.internal_time = 0
        self.delay_follow_finish = False

    @classmethod
    def instance(cls):
        return MathSpring()

    @classproperty
    def name(cls):
        return 'mathSpring'

    @classproperty
    def id(cls):
        return om.MTypeId(0x7ff50)

    @classmethod
    def initializer(cls):
        # input
        fn_numeric_attr = om.MFnNumericAttribute()

        # input time
        cls.time_attr = fn_numeric_attr.create('time', 't', om.MFnNumericData.kFloat, 0)
        fn_numeric_attr.keyable = True
        cls.addAttribute(cls.time_attr)

        # input keyframes
        fn_typed_attr = om.MFnTypedAttribute()
        cls.keyframes_attr = fn_typed_attr.create('keyframes', 'kfs', om.MFnStringData.kString)
        fn_typed_attr.array = True
        cls.addAttribute(cls.keyframes_attr)

        # input source
        cls.source_attr = fn_typed_attr.create('source', 'src', om.MFnData.kString)
        fn_typed_attr.keyable = True
        cls.addAttribute(cls.source_attr)

        # output
        cls.output_x_attr = fn_numeric_attr.create('outputX', 'ox', om.MFnNumericData.kFloat, 0.0)
        cls.addAttribute(cls.output_x_attr)

        cls.output_y_attr = fn_numeric_attr.create('outputY', 'oy', om.MFnNumericData.kFloat, 0.0)
        cls.addAttribute(cls.output_y_attr)

        cls.output_z_attr = fn_numeric_attr.create('outputZ', 'oz', om.MFnNumericData.kFloat, 0.0)
        cls.addAttribute(cls.output_z_attr)

        cls.output_attr = fn_numeric_attr.create('output', 'out', cls.output_x_attr, cls.output_y_attr, cls.output_z_attr)
        cls.addAttribute(cls.output_attr)

        # Affects
        cls.attributeAffects(cls.time_attr, cls.output_x_attr)
        cls.attributeAffects(cls.keyframes_attr, cls.output_x_attr)
        cls.attributeAffects(cls.source_attr, cls.output_x_attr)

        cls.attributeAffects(cls.time_attr, cls.output_y_attr)
        cls.attributeAffects(cls.keyframes_attr, cls.output_y_attr)
        cls.attributeAffects(cls.source_attr, cls.output_y_attr)

        cls.attributeAffects(cls.time_attr, cls.output_z_attr)
        cls.attributeAffects(cls.keyframes_attr, cls.output_z_attr)
        cls.attributeAffects(cls.source_attr, cls.output_z_attr)

        cls.attributeAffects(cls.time_attr, cls.output_attr)
        cls.attributeAffects(cls.keyframes_attr, cls.output_attr)
        cls.attributeAffects(cls.source_attr, cls.output_attr)

        cls.attributeAffects(cls.output_x_attr, cls.output_attr)
        cls.attributeAffects(cls.output_y_attr, cls.output_attr)
        cls.attributeAffects(cls.output_z_attr, cls.output_attr)

    def compute(self, plug, data_block):
        """
        Node computation method.
            - pPlug: A connection point related to one of our node attributes (could be an input or an output)
            - pDataBlock: Contains the data on which we will base our computations.
        """
        if plug == self.output_attr or \
                plug == self.output_x_attr or \
                plug == self.output_y_attr or \
                plug == self.output_z_attr:
            # input
            time_data_handle = data_block.inputValue(self.time_attr)
            time_value = time_data_handle.asFloat()

            keyframes_data_handle = data_block.inputArrayValue(self.keyframes_attr)  # MArrayDataHandle
            keyframes_values = list()
            while not keyframes_data_handle.isDone():
                index = keyframes_data_handle.elementLogicalIndex()
                keyframes_data_handle.jumpToLogicalElement(index)
                keyframe_value_str = keyframes_data_handle.inputValue().asString()
                keyframes_values.insert(index, KeyframeData(keyframe_value_str))
                keyframes_data_handle.next()

            output_value = self.animate(time_value, keyframes_values)

            # output
            output_data_handle = data_block.outputValue(self.output_attr)
            output_data_handle.set3Float(output_value.x, output_value.y, output_value.z)

            output_data_handle.setClean()
        else:
            return om.MFn.kUnknown

    def animate(self, frame, keyframes):
        """
        :param frame: current time
        :param keyframes: list of KeyframeData instance
        :return:
        """
        keyframe_data = None
        for i in reversed(range(len(keyframes))):
            _keyframe_data = keyframes[i]

            if _keyframe_data.keyframe <= frame:
                keyframe_data = _keyframe_data
                break

        if keyframe_data:
            damping_result = self.damping(frame, keyframe_data)
            follow = keyframe_data.follow
            if follow:
                follow_result = self.follow(frame, keyframe_data)
            else:
                follow_result = om.MVector.kZeroVector

            result = damping_result + follow_result
        else:
            result = om.MVector.kZeroVector

        return result

    def damping(self, frame, keyframe_data):
        damping_start_frame = keyframe_data.keyframe
        damping = keyframe_data.damping
        cycle = keyframe_data.cycle
        amplitude = keyframe_data.amplitude
        disturbance = keyframe_data.disturbance
        gravity = keyframe_data.gravity

        t = frame - damping_start_frame
        oscillator = math.exp(-damping * t) * math.sin(t * cycle) * amplitude
        return om.MVector(oscillator, oscillator, oscillator)

    def follow(self, frame, keyframe_data):
        follow_object = keyframe_data.follow_object
        follow_delay = keyframe_data.follow_delay
        follow_amp = keyframe_data.follow_amp

        rx = ry = rz = 0
        if keyframe_data.rx:
            rx = mc.getAttr(follow_object + '.rx', t=frame-follow_delay)
        if keyframe_data.ry:
            ry = mc.getAttr(follow_object + '.ry', t=frame-follow_delay)
        if keyframe_data.rz:
            rz = mc.getAttr(follow_object + '.rz', t=frame-follow_delay)
        return om.MVector(rx, ry, rz) * follow_amp


