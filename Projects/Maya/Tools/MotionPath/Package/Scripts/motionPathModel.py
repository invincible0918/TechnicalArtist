#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/18
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : motionPathModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial


class MotionPathModel(Model):
    def lateInit(self, **kwargs):
        super(MotionPathModel, self).lateInit(**kwargs)
