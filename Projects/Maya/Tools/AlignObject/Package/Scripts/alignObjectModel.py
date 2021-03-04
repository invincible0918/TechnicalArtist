#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/06/03
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : alignObjectModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial
import maya.cmds as cmds


class AlignObjectModel(Model):
    def lateInit(self, **kwargs):
        super(AlignObjectModel, self).lateInit(**kwargs)

