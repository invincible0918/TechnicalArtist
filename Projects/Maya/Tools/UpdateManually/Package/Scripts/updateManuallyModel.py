#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/01/03
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : updateManuallyModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial


class UpdateManuallyModel(Model):
    def lateInit(self, **kwargs):
        super(UpdateManuallyModel, self).lateInit(**kwargs)
