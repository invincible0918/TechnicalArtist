#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/03/08
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : mBConsoleModel.py

import os
from Core.MotionBuilderGUI.LitFrame.model import Model
from functools import partial


class MBConsoleModel(Model):
    def lateInit(self, **kwargs):
        super(MBConsoleModel, self).lateInit(**kwargs)
