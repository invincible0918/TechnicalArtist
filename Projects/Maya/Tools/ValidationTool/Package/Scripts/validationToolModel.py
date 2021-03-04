#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/27
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : validationToolModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial


class ValidationToolModel(Model):
    def lateInit(self, **kwargs):
        super(ValidationToolModel, self).lateInit(**kwargs)
