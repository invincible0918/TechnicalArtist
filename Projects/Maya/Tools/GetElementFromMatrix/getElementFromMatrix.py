# coding: utf-8

import sys
import maya.OpenMaya as om
import maya.OpenMayaMPx as ompx


class GetElementFromMatrix(ompx.MPxNode):
    kPluginNodeName = "getElementFromMatrix"
    kPluginNodeId = om.MTypeId(0x0055AA5B)

    def __init__(self):
        ompx.MPxNode.__init__(self)

    @classmethod
    def nodeCreator(cls):
        return ompx.asMPxPtr(cls())

    @classmethod
    def nodeInitializer(cls):
        # input
        matrix_attr = om.MFnMatrixAttribute()
        cls.input_matrix = matrix_attr.create('inputMatrix', 'im')
        matrix_attr.setHidden(False)
        matrix_attr.setKeyable(True)
        matrix_attr.setStorable(True)

        cls.addAttribute(cls.input_matrix)

        # output
        num_attr = om.MFnNumericAttribute()
        cls.output_elements = num_attr.create('outputElements', 'oes', om.MFnNumericData.kFloat, False)
        num_attr.setArray(True)
        num_attr.setReadable(True)
        num_attr.setUsesArrayDataBuilder(True)

        cls.addAttribute(cls.output_elements)

        # Affects
        cls.attributeAffects(cls.input_matrix, cls.output_elements)

    def compute(self, plug, block):
        this_node = self.thisMObject()

        # get input handles
        input_matrix_handle = block.inputValue(self.input_matrix)
        mat = input_matrix_handle.asMatrix()

        # get output plug
        output_elements_plug = om.MPlug(this_node, self.output_elements)

        output_elements_handle = output_elements_plug.constructHandle(block)
        array_handle = om.MArrayDataHandle(output_elements_handle)
        array_builder = array_handle.builder()

        index = 0
        for i in range(4):
            for j in range(4):
                data_handle = array_builder.addElement(index)
                data_handle.setFloat(mat(i, j))

                index += 1

        # refresh connection
        array_handle.set(array_builder)
        output_elements_plug.setMDataHandle(output_elements_handle)
        output_elements_plug.destructHandle(output_elements_handle)

        block.setClean(plug)


def initializePlugin(mobject):
    m_plugin = ompx.MFnPlugin(mobject, "Massive Entertainement", "1.0", "Any")
    try:
        m_plugin.registerNode(
            GetElementFromMatrix.kPluginNodeName,
            GetElementFromMatrix.kPluginNodeId,
            GetElementFromMatrix.nodeCreator,
            GetElementFromMatrix.nodeInitializer
        )
    except:
        sys.stderr.write("Failed to register node: %s\n" % GetElementFromMatrix.kPluginNodeName)
        raise


def uninitializePlugin(mobject):
    m_plugin = ompx.MFnPlugin(mobject)
    try:
        m_plugin.deregisterNode(GetElementFromMatrix.kPluginNodeId)
    except:
        sys.stderr.write("Failed to unregister node: %s\n" % GetElementFromMatrix.kPluginNodeName)
        raise
