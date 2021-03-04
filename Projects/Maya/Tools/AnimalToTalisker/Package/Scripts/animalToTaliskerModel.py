#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/05/09
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : animalToTaliskerModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial


class AnimalToTaliskerModel(Model):
    def lateInit(self, **kwargs):
        super(AnimalToTaliskerModel, self).lateInit(**kwargs)
