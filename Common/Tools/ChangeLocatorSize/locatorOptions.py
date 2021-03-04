#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/3/10
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : locatorOptions.py


from maya import cmds as mc
from MayaGUI.option import OptionWindow


class LocatorOption(OptionWindow):
    MinValue = 0.001
    MaxValue = 0.01
    DefaultValue = 0.01
    BestValue = 0.003

    def __init__(self):
        super(LocatorOption, self).__init__('Locator')
        self.__locators = []

    @property
    def _doButtonLabel(self):
        return 'Change Locator Size'

    def _saveSettings(self, *args):
        print 'Save Settings'

    def _resetSettings(self, *args):
        self.__changeSize(self.DefaultValue)

        mc.floatSliderGrp(self.__control, e=True, value=self.DefaultValue)

    def _toolOrAction(self, selection, *args):
        print selection

    def _help(self, *args):
        print 'help'

    def _apply(self, *args):
        value = mc.floatSliderGrp(self.__control, q=True, value=True)

        if value > self.MinValue and value < self.MaxValue:
            self.__changeSize(value)

    def _gui(self):
        self.__locators = mc.ls(type='locator')

        mc.columnLayout(columnAttach=('both', 5), adjustableColumn=True)
        mc.frameLayout(label='Settings', borderStyle='out', h=100)
        self.__control = mc.floatSliderButtonGrp(label='Change Locator Size: ',
                                                 columnWidth=[(1, 150),
                                                              (2, 50),
                                                              (3, 50),
                                                              (4, 200)],
                                                 field=True,
                                                 minValue=self.MinValue,
                                                 maxValue=self.MaxValue,
                                                 fieldMinValue=self.MinValue,
                                                 fieldMaxValue=self.MaxValue,
                                                 value=self.BestValue,
                                                 step=0.001,
                                                 dragCommand=self._apply,
                                                 buttonLabel='Reset Settings',
                                                 bc=self._resetSettings)

        mc.setParent('..')
        mc.setParent('..')

    def __changeSize(self, value):
        for locator in self.__locators:
            mc.select(locator, r=True)
            mc.setAttr(locator + '.localScaleX', value)
            mc.setAttr(locator + '.localScaleY', value)
            mc.setAttr(locator + '.localScaleZ', value)
            mc.select(cl=True)

    def doItNow(self):
        """
        don't show gui, change the size immediately
        :return:
        """
        self.__locators = mc.ls(type='locator')
        self.__changeSize(self.BestValue)

