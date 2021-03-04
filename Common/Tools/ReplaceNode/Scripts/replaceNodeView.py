#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/7/11
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : exportTexturesView.py


import os
from Core.MayaGUI.LitFrame.view import View


class ReplaceNodeView(View):
    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/gui.ui')

    def _bindMethod(self):
        # bind button method
        self._ui.doItBTN.clicked.connect(self.__doIt)

    def __doIt(self):
        sourceString = self._ui.sourceLE.text()
        destString = self._ui.destLE.text()
        self._sendMessage('doIt', sourceString, destString)
