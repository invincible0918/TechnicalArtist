#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/05/16
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : wildLifeLegModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial
from maya import cmds as mc
from JointChain import ikJointChain
reload(ikJointChain)
from JointChain import fkJointChain
reload(fkJointChain)


class WildLifeLegModel(Model):
    JointControllerMap = {}

    IKControllerRoot = 'L_F_IKLegConst'
    FKControllerRoot = 'L_F_FKLegConst'
    
    Controllers = ['L_F_IKLegConst', 'L_F_FKLegConst', 'L_F_ikLowerOffsetLeg_Ctl']

    SourceIKJointRoot = 'L_F_upperLeg_ik'
    SourceFKJointRoot = 'L_F_upperLeg_fk'
    SkinJointRoot = 'L_F_upperLeg'

    IKFKSwitchController = 'ikfk_switcher'

    def lateInit(self, **kwargs):
        super(WildLifeLegModel, self).lateInit(**kwargs)

        def getAll(parentNode, li):
            if parentNode not in li:
                li.append(parentNode)

            children = mc.listRelatives(parentNode, c=True, f=True)
            if children:
                for child in children:
                    getAll(child, li)

        def getFullPath(node, path=''):
            if not path:
                path = '|' + path
            parents = mc.listRelatives(node, p=True)
            if parents:
                path = '|' + parents[0] + path
                return getFullPath(parents[0], path)
            else:
                return path

        li = list()
        getAll('group1', li)

        di = dict()
        for node in li:
            attrs = list()

            sources = mc.listConnections(node, c=True, p=True, s=True, d=False)
            dests = mc.listConnections(node, c=True, p=True, s=False, d=True)

            if sources:
                for i in range(0, len(sources), 2):
                    if sources[i + 1].split('.')[-1] != 'scale':
                        fromPath = getFullPath(sources[i + 1])
                        toPath = getFullPath(sources[i])

                        if not fromPath.endswith(sources[i + 1]) or toPath.endswith(sources[i]):
                            print sources[i + 1], sources[i], fromPath, toPath
                        attrs.append((sources[i + 1], sources[i]))

            if dests:
                for i in range(0, len(dests), 2):
                    if dests[i].split('.')[-1] != 'scale':
                        fromPath = getFullPath(dests[i])
                        toPath = getFullPath(dests[i + 1])

                        if not fromPath.endswith(dests[i]) or toPath.endswith(dests[i + 1]):
                            print dests[i], dests[i + 1], fromPath, toPath
                        attrs.append((dests[i], dests[i + 1]))

            di[node] = attrs

        for k, v in di.items():
            print k
            for attr in v:
                print attr
            print '\n'






        # skinJointList, ikSourceJointList, fkSourceJointList, ikDestJointList, fkDestJointList, transformSpace = self.__setup()
        # self.__mirrorGroup(skinJointList, ikSourceJointList, fkSourceJointList, ikDestJointList, fkDestJointList, transformSpace)

    def __mirrorGroup(self, skinJointList, ikSourceJointList, fkSourceJointList, ikDestJointList, fkDestJointList, transformSpace):
        """
        From L_XXX to R_XXX
        :return:
        """
        def convertSourceJointList(sourceJointList):
            li = list()
            for data in sourceJointList:
                d = dict()
                d['sourceJoint'] = data['sourceJoint'].replace('L_', 'R_')

                d['ikHandle'] = data['ikHandle'].replace('L_', 'R_') if 'ikHandle' in data and data['ikHandle'] else None
                # ik handle pos is world space, mirror to yz plane
                d['attrs'] = [(pair[0].replace('L_', 'R_'), pair[1].replace('L_', 'R_')) for pair in data['attrs']]
                d['constraints'] = [c.replace('L_', 'R_') for c in data['constraints']]

                li.append(d)
            return li

        def convertDestJointList(destJointList):
            li = list()
            for data in destJointList:
                d = dict()
                d['sourceJoint'] = data['sourceJoint'].replace('L_', 'R_')
                d['destJoint'] = data['destJoint'].replace('L_', 'R_')

                d['ikHandle'] = data['ikHandle'].replace('L_', 'R_') if 'ikHandle' in data and data['ikHandle'] else None
                # ik handle pos is world space, mirror to yz plane
                d['ikHandlePos'] = [-data['ikHandlePos'][0], data['ikHandlePos'][1], data['ikHandlePos'][2]] if 'ikHandlePos' in data and data['ikHandlePos'] else None
                d['attrs'] = [(pair[0].replace('L_', 'R_'), pair[1].replace('L_', 'R_')) for pair in data['attrs']]
                d['constraints'] = [c.replace('L_', 'R_') for c in data['constraints']]

                li.append(d)
            return li

        sourceIKChain = ikJointChain.IKJointChain(self.SourceIKJointRoot.replace('L_', 'R_'),
                                                  self.SkinJointRoot.replace('L_', 'R_'),
                                                  self.IKControllerRoot.replace('L_', 'R_'))

        sourceFKChain = fkJointChain.FKJointChain(self.SourceFKJointRoot.replace('L_', 'R_'),
                                                  self.SkinJointRoot.replace('L_', 'R_'),
                                                  self.FKControllerRoot.replace('L_', 'R_'))

        skinJointList = [j.replace('L_', 'R_') for j in skinJointList]
        ikSourceJointList = convertSourceJointList(ikSourceJointList)
        fkSourceJointList = convertSourceJointList(fkSourceJointList)

        _ikDestJointList, ikGroupName = sourceIKChain.createJointChain(skinJointList, ikSourceJointList)
        _fkDestJointList, fkGroupName = sourceFKChain.createJointChain(skinJointList, fkSourceJointList)

        sourceIKChain.parentConstraint(ikGroupName)
        sourceFKChain.parentConstraint(fkGroupName)

        ikDestJointList = convertDestJointList(ikDestJointList)
        fkDestJointList = convertDestJointList(fkDestJointList)

        ikfkSwitcherController = self.__createIKFKSwitcher([data['destJoint'] for data in ikDestJointList],
                                                           [data['destJoint'] for data in fkDestJointList],
                                                           skinJointList,
                                                           self.IKControllerRoot.replace('L_', 'R_'))

        # sourceIKChain.breakAttr(ikDestJointList)
        # sourceFKChain.breakAttr(fkDestJointList)

        # self.__relocateRootController(self.IKControllerRoot, sourceIKChain.skinJointList)
        # sourceIKChain.relocateIKHandles(ikDestJointList)

        sourceIKChain.connectAttr(ikDestJointList)
        sourceFKChain.connectAttr(fkDestJointList)

        for controller, parents in transformSpace.items():
            mc.parentConstraint(parents, controller.replace('L_', 'R_'), mo=True, w=1)

        # self.__displayIKFK(ikfkSwitcherController.replace('L_', 'R_'))

    def __setup(self):
        sourceIKChain = ikJointChain.IKJointChain(self.SourceIKJointRoot, self.SkinJointRoot, self.IKControllerRoot)
        sourceFKChain = fkJointChain.FKJointChain(self.SourceFKJointRoot, self.SkinJointRoot, self.FKControllerRoot)

        skinJointList, ikSourceJointList = sourceIKChain.generateSourceJointList()
        skinJointList, fkSourceJointList = sourceFKChain.generateSourceJointList()

        ikDestJointList, ikGroupName = sourceIKChain.createJointChain(skinJointList, ikSourceJointList)
        fkDestJointList, fkGroupName = sourceFKChain.createJointChain(skinJointList, fkSourceJointList)

        ikDestJointList = sourceIKChain.generateDestJointList(ikSourceJointList, ikDestJointList)
        fkDestJointList = sourceFKChain.generateDestJointList(fkSourceJointList, fkDestJointList)

        sourceIKChain.parentConstraint(ikGroupName)
        sourceFKChain.parentConstraint(fkGroupName)

        ikfkSwitcherController = self.__createIKFKSwitcher([data['destJoint'] for data in ikDestJointList],
                                                           [data['destJoint'] for data in fkDestJointList],
                                                           skinJointList,
                                                           self.IKControllerRoot)

        sourceIKChain.breakAttr(ikDestJointList)
        sourceFKChain.breakAttr(fkDestJointList)

        # self.__relocateRootController(self.IKControllerRoot, sourceIKChain.skinJointList)
        # sourceIKChain.relocateIKHandles(ikDestJointList)

        sourceIKChain.connectAttr(ikDestJointList)
        sourceFKChain.connectAttr(fkDestJointList)

        # self.__displayIKFK(ikfkSwitcherController)

        transformSpace = dict() #sourceIKChain.getTransformSpace(self.Controllers)

        return skinJointList, ikSourceJointList, fkSourceJointList, ikDestJointList, fkDestJointList, transformSpace

    def __createIKFKSwitcher(self, ikJointList, fkJointList, skinJointList, controller):
        """
        Using maya node "pairBlend" to set ik/fk switcher
        :param ikJointList:
        :param fkJointList:
        :param skinJointList:
        :return:
        """
        # 1. create ik/fk switcher controller
        ikfkSwitcherFile = os.path.join(os.path.split(__file__)[0], '../MayaFiles/ikfk_switcher.fbx')
        mc.file(ikfkSwitcherFile, i=True, rpr=':')

        bb = mc.xform(controller, q=True, bb=True, ws=True)
        cp = [(bb[0]+bb[3])/2.0, (bb[1]+bb[4])/2.0, (bb[2]+bb[5])/2.0]
        ikfkSwitcherController = mc.rename(self.IKFKSwitchController, '%s_%s' % (skinJointList[0], self.IKFKSwitchController))
        mc.xform(ikfkSwitcherController, t=cp, ws=True, a=True)
        mc.parent(ikfkSwitcherController, controller)

        # 2. create ik/fk enum attribute to controller
        if not mc.attributeQuery('ikFkSwitcher', node=ikfkSwitcherController, exists=True):
            mc.addAttr(ikfkSwitcherController,
                       keyable=True,
                       longName='ikFkSwitcher',
                       attributeType='enum',
                       enumName='IK:FK:')

        # 3. use pair blend node
        for i in range(len(ikJointList)):
            if i < len(ikJointList):
                ikJoint = ikJointList[i]
            else:
                ikJoint = None

            if i < len(fkJointList):
                fkJoint = fkJointList[i]
            else:
                fkJoint = None

            skinJoint = skinJointList[i]

            # before pair blend, record the offset
            offsetX = mc.getAttr(skinJoint + '.tx')
            offsetY = mc.getAttr(skinJoint + '.ty')
            offsetZ = mc.getAttr(skinJoint + '.tz')

            # ik joint -> channel 1, fk joint -> channel 2
            pb = mc.pairBlend(node=skinJoint, attribute=['tx', 'ty', 'tz', 'rx', 'ry', 'rz'])

            mc.connectAttr(ikfkSwitcherController + '.ikFkSwitcher', pb + '.weight', f=True)
            if ikJoint:
                mc.connectAttr(ikJoint + '.translate', pb + '.inTranslate1', f=True)
                mc.connectAttr(ikJoint + '.rotate', pb + '.inRotate1', f=True)

            if fkJoint:
                mc.connectAttr(fkJoint + '.translate', pb + '.inTranslate2', f=True)
                mc.connectAttr(fkJoint + '.rotate', pb + '.inRotate2', f=True)
            mc.connectAttr(pb + '.outRotate', skinJoint + '.rotate', f=True)

            # only joint chain root joint needs offset
            if i == 0:
                fx = mc.shadingNode('floatConstant', asUtility=True)
                mc.setAttr(fx+'.inFloat', offsetX)

                fy = mc.shadingNode('floatConstant', asUtility=True)
                mc.setAttr(fy+'.inFloat', offsetY)

                fz = mc.shadingNode('floatConstant', asUtility=True)
                mc.setAttr(fz+'.inFloat', offsetZ)

                channel = mc.shadingNode('channels', asUtility=True)
                mc.connectAttr(fx + '.outFloat', channel + '.inColorR', f=True)
                mc.connectAttr(fy + '.outFloat', channel + '.inColorG', f=True)
                mc.connectAttr(fz + '.outFloat', channel + '.inColorB', f=True)

                plusMinusAverage = mc.shadingNode('plusMinusAverage', asUtility=True)
                mc.connectAttr(pb+'.outTranslateX', plusMinusAverage+'.input3D[0].input3Dx', f=True)
                mc.connectAttr(pb+'.outTranslateY', plusMinusAverage+'.input3D[0].input3Dy', f=True)
                mc.connectAttr(pb+'.outTranslateZ', plusMinusAverage+'.input3D[0].input3Dz', f=True)

                mc.connectAttr(channel + '.outColorR', plusMinusAverage + '.input3D[1].input3Dx', f=True)
                mc.connectAttr(channel + '.outColorG', plusMinusAverage + '.input3D[1].input3Dy', f=True)
                mc.connectAttr(channel + '.outColorB', plusMinusAverage + '.input3D[1].input3Dz', f=True)

                mc.connectAttr(plusMinusAverage+'.output3Dx', skinJoint+'.translateX', f=True)
                mc.connectAttr(plusMinusAverage+'.output3Dy', skinJoint+'.translateY', f=True)
                mc.connectAttr(plusMinusAverage+'.output3Dz', skinJoint+'.translateZ', f=True)
            else:
                mc.connectAttr(pb + '.outTranslate', skinJoint + '.translate', f=True)

        return ikfkSwitcherController

    def __relocateRootController(self, controllerRoot, dataList):
        pos = mc.xform(dataList[-1], q=True, t=True, ws=True)
        mc.xform(controllerRoot, t=pos, ws=True, a=True)

    def __displayIKFK(self, ikfkSwitcherController):
        def _getController(parent, switcherAttr):
            shapes = mc.listRelatives(parent, c=True, s=True, f=True, typ='nurbsCurve')
            if shapes:
                mc.connectAttr(switcherAttr, shapes[0]+'.v')
            children = mc.listRelatives(parent, c=True, f=True)
            if children:
                for joint in children:
                    _getController(joint, switcherAttr)

        switcherAttr = ikfkSwitcherController + '.ikFkSwitcher'
        if self.FKControllerRoot:
            _getController(self.FKControllerRoot, switcherAttr)

        reverse = mc.shadingNode('reverse', asUtility=True)
        mc.connectAttr(switcherAttr, reverse + '.input.inputX')
        if self.IKControllerRoot:
            _getController(self.IKControllerRoot, reverse + '.output.outputX')
