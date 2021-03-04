#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : YYYY/MM/DD
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : templateModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial


class TemplateModel(Model):
    def lateInit(self, **kwargs):
        super(TemplateModel, self).lateInit(**kwargs)
