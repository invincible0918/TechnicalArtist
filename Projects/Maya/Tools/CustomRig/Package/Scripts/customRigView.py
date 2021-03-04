#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/25
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : customRigView.py


import os
from Core.MayaGUI.LitFrame.view import View
from functools import partial


class CustomRigView(View):
    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/dialog.ui')

    def _initGUI(self):
        pass

    def _bindMethod(self):
        def limb_rotator_selector():
            if self._ui.ankleRB.checked():
                self._ui.footRB.setChecked(False)
            if self._ui.footRB.checked():
                self._ui.ankleRB.setChecked(False)

        # self._ui.ankleRB.clicked.connect(limb_rotator_selector)
        # self._ui.footRB.clicked.connect(limb_rotator_selector)

        self._ui.ankleBTN.clicked.connect(partial(self._sendMessage, 'expose_ankle_attribute'))
        self._ui.footBTN.clicked.connect(partial(self._sendMessage, 'expose_foot_attribute'))
        self._ui.dflBTN.clicked.connect(partial(self._sendMessage, 'display_femur_limitation'))
        self._ui.linkBTN.clicked.connect(partial(self._sendMessage, 'link_rotator_ctl', str(self._ui.ankleRB.isChecked())+str(self._ui.footRB.isChecked())))

    def log(self, msg):
        self._ui.outputLB.setText(msg)
