# coding: utf-8

import math
import maya.api.OpenMaya as om
from mathNode import MathNode
from Common.Functions.implement import classproperty


class MathPow(MathNode):
    @classmethod
    def instance(cls):
        return MathPow()

    @classproperty
    def name(cls):
        return 'mathPow'

    @classproperty
    def id(cls):
        return om.MTypeId(0x7ff02)

    @classmethod
    def initializer(cls):
        # input
        fn_numeric_attr = om.MFnNumericAttribute()
        cls.base_attr = fn_numeric_attr.create('base', 'b', om.MFnNumericData.kFloat, 1.0)
        fn_numeric_attr.writable = True
        fn_numeric_attr.storable = True
        fn_numeric_attr.hidden = False
        cls.addAttribute(cls.base_attr)

        cls.exponent_attr = fn_numeric_attr.create('exponent', 'exp', om.MFnNumericData.kFloat, 1.0)
        fn_numeric_attr.writable = True
        fn_numeric_attr.storable = True
        fn_numeric_attr.hidden = False
        cls.addAttribute(cls.exponent_attr)

        # output
        cls.output_attr = fn_numeric_attr.create('output', 'out', om.MFnNumericData.kFloat)
        fn_numeric_attr.storable = False
        fn_numeric_attr.writable = False
        fn_numeric_attr.readable = True
        fn_numeric_attr.hidden = False
        cls.addAttribute(cls.output_attr)

        # Affects
        cls.attributeAffects(cls.base_attr, cls.output_attr)
        cls.attributeAffects(cls.exponent_attr, cls.output_attr)

    def compute(self, plug, data_block):
        """
        Node computation method.
            - pPlug: A connection point related to one of our node attributes (could be an input or an output)
            - pDataBlock: Contains the data on which we will base our computations.
        """
        if plug == self.output_attr:
            base_data_handle = data_block.inputValue(self.base_attr)
            exponent_data_handle = data_block.inputValue(self.exponent_attr)
            output_data_handle = data_block.outputValue(self.output_attr)

            base_value = base_data_handle.asFloat()
            exponent_value = exponent_data_handle.asFloat()
            output_value = math.pow(base_value, exponent_value)

            output_data_handle.setFloat(output_value)
            output_data_handle.setClean()
        else:
            return om.kUnknownParameter