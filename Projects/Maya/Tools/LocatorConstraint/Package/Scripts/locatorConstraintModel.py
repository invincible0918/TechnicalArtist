#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/16
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : locatorConstraintModel.py

from Core.MayaGUI.LitFrame.model import Model
from maya import cmds


class LocatorConstraintModel(Model):
    def lateInit(self, **kwargs):
        super(LocatorConstraintModel, self).lateInit(**kwargs)

        sels = cmds.ls(sl=True)
        locs = []
        for ctrl in sels:
            pos = cmds.xform(ctrl, q=True, ws=True, rp=True)
            rot = cmds.xform(ctrl, q=True, ws=True, ro=True)
            loc = cmds.spaceLocator(n=ctrl + '_loc')[0]
            cmds.xform(loc, t=pos, ro=rot, ws=True)
            cmds.parentConstraint(ctrl, loc, mo=True)
            locs.append(loc)
        cmds.select(locs, r=True)
