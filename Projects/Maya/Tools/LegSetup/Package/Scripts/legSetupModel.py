#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/06/06
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : legSetupModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from JointChain import iKJointChain
reload(iKJointChain)
from JointChain import fKJointChain
reload(fKJointChain)
from maya import cmds as mc
from functools import partial


class LegSetupModel(Model):
    def lateInit(self, **kwargs):
        super(LegSetupModel, self).lateInit(**kwargs)

        self.do('L_F_upperLeg', 'L_F_toe_End')
        # self.do('R_F_upperLeg', 'R_F_toe_End')
        # self.do('L_M_upperLeg', 'L_M_toe_End')
        # self.do('R_M_upperLeg', 'R_M_toe_End')
        # self.do('L_B_upperLeg', 'L_B_toe_End')
        # self.do('R_B_upperLeg', 'R_B_toe_End')

    def do(self, startJoint, endJoint):
        # create joint chain
        ikJointChain = iKJointChain.IKJointChain(startJoint, endJoint)
        fkJointChain = fKJointChain.FKJointChain(startJoint, endJoint)

        # create ik/fk switcher
        switcherGrp, switcherCtl = self.__createIKFKSwitcher(ikJointChain, fkJointChain)

        mc.parentConstraint(ikJointChain.uuid('foot_Ctl'), switcherCtl, maintainOffset=True, weight=1.0)

        self.__displayIKFK(ikJointChain.controller, fkJointChain.controller, switcherCtl)

        # group all rig
        grpName = ikJointChain.skinJointChain[0].split('|')[-1] + '_Rig_Grp'
        mc.select(cl=True)
        mc.select(ikJointChain.controller, add=True)
        mc.select(fkJointChain.controller, add=True)
        mc.select(switcherGrp, add=True)
        mc.group(n=grpName)
        mc.select(cl=True)

    def __createIKFKSwitcher(self, ikJointChain, fkJointChain):
        """
        Using maya node "pairBlend" to set ik/fk switcher
        :return:
        """
        ikJointList = ikJointChain.jointChain
        fkJointList = fkJointChain.jointChain
        skinJointList = ikJointChain.skinJointChain

        switcherCtl = ikJointChain.importCtl('switcher_Ctl')
        switcherGrp = ikJointChain.uuid('switcher_Grp')
        mc.rename('switcher_Grp', switcherGrp)

        pos = mc.xform(skinJointList[3], q=True, t=True, ws=True)
        mc.move(pos[0], pos[1], pos[2], switcherGrp, absolute=True)

        mc.makeIdentity(switcherGrp, apply=True, t=True, r=True, s=True, normal=0, preserveNormals=True)

        # 2. use pair blend node
        for i in range(len(ikJointList)):
            ikJoint = ikJointList[i]
            fkJoint = fkJointList[i]
            skinJoint = skinJointList[i]

            pb = mc.pairBlend(node=skinJoint, attribute=['tx', 'ty', 'tz', 'rx', 'ry', 'rz'])

            mc.connectAttr(switcherCtl + '.IKFKSwitcher', pb + '.weight', f=True)

            mc.connectAttr(ikJoint + '.translate', pb + '.inTranslate1', f=True)
            mc.connectAttr(ikJoint + '.rotate', pb + '.inRotate1', f=True)

            mc.connectAttr(fkJoint + '.translate', pb + '.inTranslate2', f=True)
            mc.connectAttr(fkJoint + '.rotate', pb + '.inRotate2', f=True)

            mc.connectAttr(pb + '.outTranslate', skinJoint + '.translate', f=True)
            mc.connectAttr(pb + '.outRotate', skinJoint + '.rotate', f=True)

        return switcherGrp, switcherCtl

    def __displayIKFK(self, ikCtl, fkCtl, switcherCtl):
        def _getController(parent, switcherAttr):
            shapes = mc.listRelatives(parent, c=True, s=True, f=True, typ='nurbsCurve')
            if shapes:
                mc.connectAttr(switcherAttr, shapes[0]+'.v')
            children = mc.listRelatives(parent, c=True, f=True)
            if children:
                for joint in children:
                    _getController(joint, switcherAttr)

        switcherAttr = switcherCtl + '.IKFKSwitcher'
        _getController(fkCtl, switcherAttr)

        reverse = mc.shadingNode('reverse', asUtility=True)
        mc.connectAttr(switcherAttr, reverse + '.input.inputX')
        _getController(ikCtl, reverse + '.output.outputX')
