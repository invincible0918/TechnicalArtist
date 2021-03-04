#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/02/25
# @Company : UBISOFT SHANGHAI
# @Author  : Sun Jing
# @Email   : jing.sun4@ubisoft.com
# @File    : prefMarkerView.py


import os
from Core.MayaGUI.LitFrame.view import View
from functools import partial


class PrefMarkerView(View):
    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/dialog.ui')

    def _initGUI(self):
        pass

    def _bindMethod(self):
        self._ui.markerBTN.clicked.connect(partial(self._sendMessage, 'import_marker_preset'))
        self._ui.locatorBTN.clicked.connect(partial(self._sendMessage, 'select_the_locator'))
        self._ui.curveBTN.clicked.connect(partial(self._sendMessage, 'select_the_curve'))
        self._ui.finishBTN.clicked.connect(partial(self._sendMessage, 'finish_the_rig'))
