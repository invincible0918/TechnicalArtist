# coding: utf-8

import math
import maya.api.OpenMaya as om
from mathNode import MathNode
from Common.Functions.implement import classproperty


class MathMod(MathNode):
    @classmethod
    def instance(cls):
        return MathMod()

    @classproperty
    def name(cls):
        return 'mathMod'

    @classproperty
    def id(cls):
        return om.MTypeId(0x7ff05)

    @classmethod
    def initializer(cls):
        # input
        fn_numeric_attr = om.MFnNumericAttribute()
        cls.input_attr = fn_numeric_attr.create('input', 'in', om.MFnNumericData.kFloat, 1.0)
        fn_numeric_attr.readable = True
        fn_numeric_attr.writable = True
        fn_numeric_attr.storable = True
        fn_numeric_attr.hidden = False
        cls.addAttribute(cls.input_attr)

        fn_numeric_attr = om.MFnNumericAttribute()
        cls.mod_attr = fn_numeric_attr.create('mod', 'm', om.MFnNumericData.kFloat, 1.0)
        fn_numeric_attr.readable = True
        fn_numeric_attr.writable = True
        fn_numeric_attr.storable = True
        fn_numeric_attr.hidden = False
        cls.addAttribute(cls.mod_attr)

        # output
        cls.output_attr = fn_numeric_attr.create('output', 'out', om.MFnNumericData.kFloat)
        fn_numeric_attr.storable = False
        fn_numeric_attr.writable = False
        fn_numeric_attr.readable = True
        fn_numeric_attr.hidden = False
        cls.addAttribute(cls.output_attr)

        # Affects
        cls.attributeAffects(cls.input_attr, cls.output_attr)
        cls.attributeAffects(cls.mod_attr, cls.output_attr)

    def compute(self, plug, data_block):
        """
        Node computation method.
            - pPlug: A connection point related to one of our node attributes (could be an input or an output)
            - pDataBlock: Contains the data on which we will base our computations.
        """
        if plug == self.output_attr:
            input_data_handle = data_block.inputValue(self.input_attr)
            mod_data_handle = data_block.inputValue(self.mod_attr)
            output_data_handle = data_block.outputValue(self.output_attr)

            input_value = input_data_handle.asFloat()
            mod_value = mod_data_handle.asFloat()
            output_value = input_value % mod_value

            output_data_handle.setFloat(output_value)
            output_data_handle.setClean()
        else:
            return om.kUnknownParameter