#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/04/29
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : mirrorAnimView.py


import os
from functools import partial
from Core.MayaGUI.LitFrame.view import View
from maya import cmds as mc


class MirrorAnimView(View):
    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/dialog.ui')

    def _initGUI(self):
        pass

    def _bindMethod(self):
        def mirror(args):
            mirror_plan = self._ui.mirrorLE.text()
            self._sendMessage('mirror', (args, mirror_plan))

        def pick():
            targets = mc.ls(sl=True)
            if targets:
                self._ui.mirrorLE.setText(targets[0])

        self._ui.l2rBTN.clicked.connect(partial(mirror, 'l2r'))
        self._ui.r2lBTN.clicked.connect(partial(mirror, 'r2l'))
        self._ui.pickBTN.clicked.connect(pick)

    def mirror_plan(self, mirror_plan):
        self._ui.mirrorLE.setText(mirror_plan)
