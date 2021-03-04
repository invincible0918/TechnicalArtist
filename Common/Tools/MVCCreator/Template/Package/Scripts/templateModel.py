#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : YYYY/MM/DD
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : templateModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial


class TemplateModel(Model):
    def lateInit(self, **kwargs):
        super(TemplateModel, self).lateInit(**kwargs)
