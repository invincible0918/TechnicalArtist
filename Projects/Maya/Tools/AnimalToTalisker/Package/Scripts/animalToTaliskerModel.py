#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/05/09
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : animalToTaliskerModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial


class AnimalToTaliskerModel(Model):
    def lateInit(self, **kwargs):
        super(AnimalToTaliskerModel, self).lateInit(**kwargs)
