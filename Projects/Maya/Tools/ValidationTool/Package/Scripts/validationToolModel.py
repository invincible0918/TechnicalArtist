#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/27
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : validationToolModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial


class ValidationToolModel(Model):
    def lateInit(self, **kwargs):
        super(ValidationToolModel, self).lateInit(**kwargs)
