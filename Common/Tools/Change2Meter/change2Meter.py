#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/8/25
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : change2Meter.py


from maya import cmds as mc


def do():
    mc.currentUnit(l='m')
    mc.grid(s=10, d=1, sp=1)
