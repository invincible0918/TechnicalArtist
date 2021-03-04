#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/01/03
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : updateManuallyModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial


class UpdateManuallyModel(Model):
    def lateInit(self, **kwargs):
        super(UpdateManuallyModel, self).lateInit(**kwargs)
