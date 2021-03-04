#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/01/08
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : ragdollToolView.py


import os
from Core.MayaGUI.LitFrame.view import View
from Core.MayaGUI.widgets import DoubleValidator
from functools import partial


class RagdollToolView(View):
    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/dialog.ui')

    def _initGUI(self):
        self._parameter_control_dict = {self._ui.massLE: 'mass',
                                        self._ui.frictionLE: 'friction',
                                        self._ui.restitutionLE: 'restitution',
                                        self._ui.maxFrictionTorqueLE: 'maxFrictionTorque'}

        for ctl in self._parameter_control_dict.keys():
            ctl.setValidator(DoubleValidator(0, 1000, 2, ctl))

    def _bindMethod(self):
        def modify_ragdoll(widget, msg):
            self._sendMessage('ragdoll_parameters', msg, float(widget.text()))

        for k, v in self._parameter_control_dict.items():
            k.returnPressed.connect(partial(modify_ragdoll, k, v))


