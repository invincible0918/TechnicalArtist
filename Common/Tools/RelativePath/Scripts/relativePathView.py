#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/12/01
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : relativePathView.py


import os
from Core.MayaGUI.LitFrame.view import View
from functools import partial


class RelativePathView(View):
    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/dialog.ui')

    def _initGUI(self):
        pass

    def _bindMethod(self):
        pass
