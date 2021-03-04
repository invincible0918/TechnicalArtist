#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/01/03
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : updateManuallyView.py


import os
from Core.MayaGUI.LitFrame.view import View


class UpdateManuallyView(View):
    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/dialog.ui')

    def _initGUI(self):
        pass

    def _bindMethod(self):
        pass
