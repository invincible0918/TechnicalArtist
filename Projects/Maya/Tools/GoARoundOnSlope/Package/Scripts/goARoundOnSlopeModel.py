#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/08/20
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : goARoundOnSlopeModel.py

import os
import sys
from Core.MayaGUI.LitFrame.model import Model
from functools import partial
from maya import cmds as mc
path = r'D:\p4ws\wlm_AC617_blue\tools\dcc\blue\dcc\maya\system\studiolibrary\src\mutils'
if path not in sys.path:
    sys.path.append(path)


class GoARoundOnSlopeModel(Model):
    def lateInit(self, **kwargs):
        super(GoARoundOnSlopeModel, self).lateInit(**kwargs)

        # slope_plane = 'pasted__pCube1'
        # aabb = mc.xform(slope_plane, q=True, boundingBox=True)
        # mc.spaceLocator(p=(aabb[0], aabb[1], aabb[2]))
        # mc.spaceLocator(p=(aabb[3], aabb[4], aabb[5]))

        # mc.polyCube()

        node = 'Hexapede_Rig:C_Ik_neckFront_Ctl'
        import localSpaceTransform
        reload(localSpaceTransform)
        ins = localSpaceTransform.LocalSpaceTransform()
        posValue, rotValue, index = ins.getPose(node, 'locator1', None)
        print posValue
