#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2021/02/23
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : simpleGUIModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial
from maya import cmds as mc


class SimpleGUIModel(Model):
    def lateInit(self, **kwargs):
        super(SimpleGUIModel, self).lateInit(**kwargs)

    def pickup1(self):
        objects = mc.ls(sl=True)
        self._sendMessage('list0', objects)

