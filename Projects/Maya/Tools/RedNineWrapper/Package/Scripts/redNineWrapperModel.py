#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/04/17
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : redNineWrapperModel.py

import os
from maya import cmds as mc
from Core.MayaGUI.LitFrame.model import Model
from functools import partial
from Red9.core.Red9_AnimationUtils import AnimFunctions
from Red9.core import Red9_CoreUtils as r9Core
import Red9.core.Red9_Meta as r9Meta

from blue.dcc.maya.core.meta_components.msvFKControl import MsvRigComponentFKControl
import blue.dcc.maya.core.msvMeta as msvMeta


class RedNineWrapperModel(Model):
    def lateInit(self, **kwargs):
        super(RedNineWrapperModel, self).lateInit(**kwargs)
        self.testMetaData()

    def testMetaData(self):
        rootJoint = mc.joint(name='rootJoint')
        base_meta = msvMeta.MsvMetaClass(name="SimpleMeta")
        base_meta.mSystemRoot = rootJoint

    def testBind(self):
        animFunc = AnimFunctions()
        attrList = ['tx', 'ty', 'tz', 'rx', 'ry', 'rz']
        for child in mc.sets('AllAnimControls', q=True):
            srcCtrl = 'THA_Idle_01:Thanator_Rig:' + child
            if mc.objExists(srcCtrl):
                print 'src: %s, dest: %s' % (srcCtrl, child)
                mc.select(cl=True)
                mc.select(srcCtrl, r=True)
                mc.select(child, tgl=True)

                for attr in attrList:
                    mc.setAttr('%s.%s' % (child, attr), l=False)

                # animFunc = AnimFunctions()
                animFunc.bindNodes()
