# coding: utf-8

import maya.api.OpenMaya as om
from abc import ABCMeta, abstractmethod
from Common.Functions.implement import abstract, classproperty


class MathNode(om.MPxNode):
    __metaclass__ = ABCMeta

    def __init__(self):
        om.MPxNode.__init__(self)

    @classmethod
    def creator(cls):
        return cls.instance()

    @classmethod
    @abstractmethod
    def instance(cls):
        return None

    @classmethod
    @abstractmethod
    def initializer(cls):
        pass

    @classproperty
    def name(cls): abstract()

    @classproperty
    def id(cls): abstract()

    @classproperty
    def classify(cls):
        return 'utility/general'

    @abstractmethod
    def compute(self, plug, block):
        pass



