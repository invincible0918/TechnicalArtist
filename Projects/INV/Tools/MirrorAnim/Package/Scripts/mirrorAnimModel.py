#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/05/03
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : mirrorAnimModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial
from maya.api import OpenMaya as om
from maya.api import OpenMayaAnim as oma
from maya import cmds as mc
import math


class MirrorAnimModel(Model):
    SourceRoot = 'B_Pelvis'
    DestRoot = 'rig_B_Pelvis'

    def lateInit(self, **kwargs):
        super(MirrorAnimModel, self).lateInit(**kwargs)

        sourceList = list()
        self.__getJoints(self.SourceRoot, sourceList)

        destList = list()
        self.__getJoints(self.DestRoot, destList)

        for i in range(len(destList)):
            if i == 0:
                pos = mc.xform(sourceList[i].fullPathName(), q=True, t=True, a=True, ws=True)
                mc.xform(destList[i].fullPathName(), t=[-pos[0], pos[1], pos[2]], a=True, ws=True)

                rot = mc.xform(sourceList[i].fullPathName(), q=True, ro=True, a=True, ws=True)
                mc.xform(destList[i].fullPathName(), ro=rot, a=True, ws=True)
            else:
                sourceNode = None
                f = destList[i].fullPathName().replace('|rig_target', '').replace('rig_', '')

                if '_L_' in f:
                    f = f.replace('_L_', '_R_')

                    for j in range(len(sourceList)):
                        if sourceList[j].fullPathName() == f:
                            sourceNode = sourceList[j]
                            break

                elif '_R_' in f:
                    f = f.replace('_R_', '_L_')
                    for j in range(len(sourceList)):
                        if sourceList[j].fullPathName() == f:
                            sourceNode = sourceList[j]
                            break
                else:
                    sourceNode = sourceList[i]

                jointOrientX = mc.getAttr(sourceNode.fullPathName() + '.jointOrientX')
                jointOrientY = mc.getAttr(sourceNode.fullPathName() + '.jointOrientY')
                jointOrientZ = mc.getAttr(sourceNode.fullPathName() + '.jointOrientZ')

                jointOrientQ = om.MEulerRotation(jointOrientX * math.pi / 180,
                                                 jointOrientY * math.pi / 180,
                                                 jointOrientZ * math.pi / 180).asQuaternion()

                q = sourceNode.rotation(om.MSpace.kTransform, True) * jointOrientQ
                q.x *= -1
                q.y *= -1

                destList[i].setRotation(q * jointOrientQ.inverse(), om.MSpace.kTransform)

    def __getJoints(self, parent, li):
        l = om.MGlobal.getSelectionListByName(parent)
        node = om.MFnTransform(l.getDependNode(0))

        li.append(node)
        children = mc.listRelatives(parent, c=True, f=True, type='joint')
        if children:
            for child in children:
                self.__getJoints(child, li)
