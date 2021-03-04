#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/06/03
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : alignObjectModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial
import maya.cmds as cmds


class AlignObjectModel(Model):
    def lateInit(self, **kwargs):
        super(AlignObjectModel, self).lateInit(**kwargs)

