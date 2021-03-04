#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/8/25
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : change2Meter.py


from maya import cmds as mc


def do():
    mc.currentUnit(l='m')
    mc.grid(s=10, d=1, sp=1)
