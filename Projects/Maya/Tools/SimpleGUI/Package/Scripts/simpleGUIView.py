#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2021/02/23
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : simpleGUIView.py


import os
from Core.MayaGUI.LitFrame.view import View
from functools import partial
from maya import cmds as mc
from maya.api import OpenMaya as om


class SimpleGUIView(View):
    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/dialog.ui')

    def _initGUI(self):
        pass

    def _bindMethod(self):
        def func():
            objects = mc.ls(sl=True)
            long_str = ','.join(objects)
            self._ui.objectLE.setText(long_str)
        self._ui.clickBTN.clicked.connect(func)
