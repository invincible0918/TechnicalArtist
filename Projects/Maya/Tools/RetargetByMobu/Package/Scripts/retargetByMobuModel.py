#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/05/02
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : retargetByMobuModel.py

import os
import math
from Core.MayaGUI.LitFrame.model import Model
from functools import partial
from maya import cmds as mc
from maya import mel as mm
from maya.api import OpenMaya as om


class RetargetByMobuModel(Model):
    """
    import maya.mel as mm
    mm.eval('NextFrame')

    from Projects.INV.Tools.RetargetByMobu.Package import main
    reload(main)

    main.run()
    """

    Root = 'Feline_Cougar:Viz:Main'
    NameSpace = 'Feline_Cougar:Viz:'
    ScaleValue = 100.0

    def lateInit(self, **kwargs):
        super(RetargetByMobuModel, self).lateInit(**kwargs)

        if mc.objExists('Main'):
            mc.delete('Main')

        self.characterized()
        # mc.rotate(90, 0, 0, self.Root, a=True, os=True, fo=True)

        sourceJointList = list()
        self.__getAllJoints('Hips', None, sourceJointList)

        destJointList = list()
        self.__getAllJoints('Feline_Cougar:Viz:Hips', None, destJointList)

        mc.xform('Feline_Cougar:Viz:Hips', t=mc.xform('Hips', q=True, t=True, ws=True, a=True), ws=True, a=True)

        for ikh in mc.ls(type='ikHandle'):
            sourceJoint = ikh.split('_')[0]
            mc.setAttr(ikh + '.snapEnable', 0)
            pos = mc.xform(sourceJoint, q=True, t=True, ws=True, a=True)
            mc.xform(ikh, t=pos, ws=True, a=True)

        return

        for i in range(len(sourceJointList)):
            if sourceJointList[i]['children']:
                sourceJoint = sourceJointList[i]['node']
                for j in range(len(destJointList)):
                    destJoint = destJointList[j]['node']
                    if sourceJoint.split('|')[-1] == destJoint.split('|')[-1].split(':')[-1]:
                        ikhandle = sourceJoint.split('|')[-1] + '_ikh'
                        print ikhandle, mc.objExists(ikhandle)
                        # mc.xform()
                        # rx = mc.getAttr(sourceJoint + '.jointOrientX')
                        # ry = mc.getAttr(sourceJoint + '.jointOrientY')
                        # rz = mc.getAttr(sourceJoint + '.jointOrientZ')
                        #
                        # mc.setAttr(destJoint + '.rx', rx)
                        # mc.setAttr(destJoint + '.ry', ry)
                        # mc.setAttr(destJoint + '.rz', rz)
                        #
                        # if sourceJoint.split('|')[-1] == 'Hips':
                        #     mc.setAttr(destJoint + '.tx', mc.getAttr(sourceJoint + '.tx'))
                        #     mc.setAttr(destJoint + '.ty', mc.getAttr(sourceJoint + '.ty'))
                        #     mc.setAttr(destJoint + '.tz', mc.getAttr(sourceJoint + '.tz'))
                        break

    def characterized(self):
        jointList = list()
        self.__getAllJoints(self.Root, None, jointList)
        # csvFile = os.path.join(os.path.dirname(__file__), r'../MayaFiles/cougar_data1\Feline_Cougar_FulB_Cage_Combat_All\Take007_Camera001\3DWorldCoorinates.csv')
        csvFile = os.path.join(os.path.dirname(__file__), r'../MayaFiles/Feline_Cougar_World_Coordinates\cougar4\joint_world_3d_position.csv')
        self.__frameList = self.__getJointData(csvFile)

        index = (int)(mc.currentTime(q=True))
        datas = self.__frameList[index]

        # create joint
        for i in range(len(jointList)):
            jointName = jointList[i]['node'].split('|')[-1].split(':')[-1]
            parentName = jointList[i]['parent'].split('|')[-1].split(':')[-1] if jointList[i]['parent'] else ''
            for joint, pos in datas.items():
                if joint == jointName:
                    if not mc.objExists(joint):
                        mc.select(cl=True)
                        mc.joint(n=joint, position=pos, absolute=True)

                    if not mc.objExists(parentName):
                        mc.select(cl=True)
                        mc.joint(n=parentName)
                    break

        # parent joint
        for i in range(len(jointList)):
            jointName = jointList[i]['node'].split('|')[-1].split(':')[-1]
            parentName = jointList[i]['parent'].split('|')[-1].split(':')[-1] if jointList[i]['parent'] else ''
            for joint, pos in datas.items():
                if joint == jointName:
                    mc.select(cl=True)
                    mc.parent(joint, parentName)
                    if joint not in ['Main', 'Hips', 'Spine2'] and parentName not in ['Main', 'Hips', 'Spine2']:
                        # print self.NameSpace + joint, self.NameSpace + parentName
                        mc.select(cl=True)
                        mc.select(self.NameSpace + parentName, r=True)
                        mc.select(self.NameSpace + joint, add=True)
                        output = mc.ikHandle()
                        mc.rename(output[0], joint + '_ikh')
                        mc.select(cl=True)
                    break

        return
        # orient joints
        mc.select('Main', replace=True)
        mm.eval('joint -e  -oj none -ch -zso;')

        mc.select('Hips', replace=True)
        mm.eval('joint -e  -oj xyz -secondaryAxisOrient yup -ch -zso;')

        mc.select('Spine', replace=True)
        mm.eval('joint -e  -oj xyz -secondaryAxisOrient yup -ch -zso;')

        mc.select('LeftUpLeg', replace=True)
        mm.eval('joint -e  -oj xyz -secondaryAxisOrient yup -ch -zso;')

        mc.select('LeftLeg', replace=True)
        mm.eval('joint -e  -oj xyz -secondaryAxisOrient zup -ch -zso;')

        mc.select('RightUpLeg', replace=True)
        mm.eval('joint -e  -oj xyz -secondaryAxisOrient yup -ch -zso;')

        mc.select('RightLeg', replace=True)
        mm.eval('joint -e  -oj xyz -secondaryAxisOrient zup -ch -zso;')

        mc.select('LeftShoulder', replace=True)
        mm.eval('joint -e  -oj xzy -secondaryAxisOrient ydown -ch -zso;')

        mc.select('LeftArm', replace=True)
        mm.eval('joint -e  -oj xzy -secondaryAxisOrient zup -ch -zso;')

        mc.select('RightShoulder', replace=True)
        mm.eval('joint -e  -oj xzy -secondaryAxisOrient ydown -ch -zso;')

        mc.select('RightArm', replace=True)
        mm.eval('joint -e  -oj xzy -secondaryAxisOrient zup -ch -zso;')

    def __getAllJoints(self, child, parent, li):
        joints = mc.listRelatives(child, c=True, f=True, typ='joint')
        li.append({'node': child, 'parent': parent, 'children': joints})
        if joints:
            for joint in joints:
                self.__getAllJoints(joint, child, li)

    def __getJointData(self, filePath):
        with open(filePath, 'r') as f:
            li = f.readlines()
            dataLength = len(li)

            keyList = li[0].replace('\r', '').replace('\n', '').split(',')
            indexLength = len(keyList)

            frameList = list()
            for i in range(1, dataLength):
                valueList = li[i].replace('\r', '').replace('\n', '').split(',')

                di = dict()
                for j in range(0, indexLength, 3):
                    jointName = keyList[j].replace('_X', '')

                    di[jointName] = list()

                    di[jointName] = om.MVector(float(valueList[j]) / self.ScaleValue, \
                                               float(valueList[j+1]) / self.ScaleValue, \
                                               float(valueList[j+2]) / self.ScaleValue)

                frameList.append(di)

            return frameList
