#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/23
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : generateHitBoxView.py


import os
from Core.MayaGUI.LitFrame.view import View
from functools import partial


class GenerateHitBoxView(View):
    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/dialog.ui')

    def _initGUI(self):
        pass

    def _bindMethod(self):
        def _open():
            path = self._ui.logLB.text()
            if path and os.path.exists(path):
                os.startfile(os.path.dirname(path))

        self._ui.generateBTN.clicked.connect(partial(self._sendMessage, 'generate'))
        self._ui.deleteBTN.clicked.connect(partial(self._sendMessage, 'delete'))
        self._ui.saveBTN.clicked.connect(partial(self._sendMessage, 'save'))
        self._ui.openBTN.clicked.connect(_open)

    def log(self, log_string):
        self._ui.logLB.setText(log_string)
