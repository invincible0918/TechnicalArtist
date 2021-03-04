#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/23
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : refreshBindFileView.py


import os
from Core.MayaGUI.LitFrame.view import View
from functools import partial


class RefreshBindFileView(View):
    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/dialog.ui')

    def _initGUI(self):
        pass

    def _bindMethod(self):
        def update_bind():
            self._sendMessage('update_bind', self._ui.influenceAssociationCB.currentText())

        self._ui.exportSkeletonBTN.clicked.connect(partial(self._sendMessage, 'export_skeleton'))
        self._ui.updateBindBTN.clicked.connect(update_bind)
        self._ui.exportBTN.clicked.connect(partial(self._sendMessage, 'export'))
        self._ui.openBTN.clicked.connect(partial(self._sendMessage, 'open'))
