#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/18
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : motionPathModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial


class MotionPathModel(Model):
    def lateInit(self, **kwargs):
        super(MotionPathModel, self).lateInit(**kwargs)
