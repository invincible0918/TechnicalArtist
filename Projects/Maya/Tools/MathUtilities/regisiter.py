# coding: utf-8
import sys
import maya.api.OpenMaya as om
from mathSin import MathSin
from mathCos import MathCos
from mathPow import MathPow
from mathExp import MathExp
from mathMod import MathMod
from mathConstant import MathConstant
import mathSpring
reload(mathSpring)
from mathSpring import MathSpring


NodeAssemblies = [MathSin, MathCos, MathPow, MathExp, MathMod, MathConstant, MathSpring]


def maya_useNewAPI():
    """
    The presence of this function tells Maya that the plugin produces, and
    expects to be passed, objects created using the Maya Python API 2.0.
    """
    pass


def initializePlugin(mobject):
    m_plugin = om.MFnPlugin(mobject, 'Massive Entertainement', '1.0', 'Any')
    for node in NodeAssemblies:
        try:
            m_plugin.registerNode(
                getattr(node, 'name', 'null'),
                getattr(node, 'id', 'null'),
                getattr(node, 'creator', 'null'),
                getattr(node, 'initializer', 'null'),
                getattr(node, 'kDependNode', 'null'),
                getattr(node, 'classify', 'null')
            )
        except:
            sys.stderr.write('Failed to register node: %s\n' % MathSin.name)
            raise


def uninitializePlugin(mobject):
    m_plugin = om.MFnPlugin(mobject)
    for node in NodeAssemblies:
        try:
            m_plugin.deregisterNode(getattr(node, 'id', 'null'))
        except:
            sys.stderr.write("Failed to unregister node: %s\n" % getattr(node, 'name', 'null'))
            raise