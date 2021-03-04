#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/07/09
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : customPoseModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial
from maya import cmds as mc
from maya.api import OpenMaya as om
from Core.IO.JSON import jsonIO


class CustomPoseModel(Model):
    def lateInit(self, **kwargs):
        super(CustomPoseModel, self).lateInit(**kwargs)

        path = r'd:\xxx.json'

        localSpaceTarget = 'locator1'
        targetFnTransform = self.__fnTransform(localSpaceTarget)
        targetParentList = list()
        self.__getAllParents(targetFnTransform.object(), targetParentList)

        # self.savePose(targetFnTransform, targetParentList, path)
        self.loadPose(targetFnTransform, targetParentList, path)

    def loadPose(self, targetFnTransform, targetParentList, path):
        o2wMat = self.__object2World(targetParentList)

        di = jsonIO.JsonRead(path).data

        li = sorted(di.items(), key=lambda item: item[1]['index'])
        for data in li:
            node = data[0]
            _pos = data[1]['pos']
            _quat = data[1]['quat']

            pos = om.MVector(_pos[0], _pos[1], _pos[2])
            quat = om.MQuaternion(_quat[0], _quat[1], _quat[2], _quat[3])

            mat = om.MTransformationMatrix()
            mat.setTranslation(pos, om.MSpace.kTransform)
            mat.setRotation(quat)

            fnTransform = self.__fnTransform(node)
            parentList = list()

            self.__getAllParents(fnTransform.object(), parentList)
            # mat = mat.asMatrix() * targetFnTransform.transformationMatrix() * o2wMat * self.__world2Object(parentList) * fnTransform.transformationMatrix().inverse()
            mat = mat.asMatrix() * targetFnTransform.transformationMatrix() * o2wMat * self.__world2Object(parentList)
            mat = om.MTransformationMatrix(mat)
            pos = mat.translation(om.MSpace.kTransform)
            quat = mat.rotation(True)

            fnTransform.setTranslation(pos, om.MSpace.kTransform)
            fnTransform.setRotation(quat, om.MSpace.kTransform)

    def savePose(self, targetFnTransform, targetParentList, path):
        self.__w2target = self.__world2Object(targetParentList) * targetFnTransform.transformationMatrix().inverse()

        # it's fn transform node list
        curveList = [self.__fnTransform(mc.listRelatives(shape, p=True, f=True)[0])
                     for shape in mc.ls(type='nurbsCurve')
                     if len(mc.listRelatives(shape, p=True, f=True)) == 1 and
                     mc.listRelatives(shape, p=True, f=True)[0] != targetFnTransform.fullPathName()]

        orderDict = dict()
        for i in range(len(curveList)):
            fullPathName = curveList[i].fullPathName()
            if fullPathName not in orderDict:
                orderDict[fullPathName] = {'index': 0,
                                           'pos': list(),
                                           'quat': list()}

            parentList = list()
            self.__getAllParents(curveList[i].object(), parentList)

            mat = curveList[i].transformationMatrix() * self.__object2World(parentList) * self.__w2target
            # mat = fnTransform.transformationMatrix() * self.__object2World(parentList) * self.__world2Object(parentList)
            # mat = fnTransform.transformationMatrix() * self.__object2World(parentList)
            pos = om.MTransformationMatrix(mat).translation(om.MSpace.kTransform)
            quat = om.MTransformationMatrix(mat).rotation(True)
            orderDict[fullPathName]['pos'] = [pos.x, pos.y, pos.z]
            orderDict[fullPathName]['quat'] = [quat.x, quat.y, quat.z, quat.w]

            # calculate index
            parentList = [parent.fullPathName() for parent in parentList]
            for j in range(len(curveList)):
                if i == j:
                    continue

                if curveList[j].fullPathName() in parentList:
                    orderDict[fullPathName]['index'] += 1

        jsonIO.JsonWrite(orderDict, path)

    def __fnTransform(self, nodeName):
        l = om.MGlobal.getSelectionListByName(nodeName)
        obj = l.getDependNode(0)
        return om.MFnTransform(obj)

    def __object2World(self, parentNodeList):
        mat = om.MMatrix()
        for i in range(len(parentNodeList)):
            mat = mat * parentNodeList[i].transformationMatrix()
        return mat

    def __world2Object(self, parentNodeList):
        mat = om.MMatrix()
        for i in reversed(range(len(parentNodeList))):
            mat = mat * parentNodeList[i].transformationMatrix().inverse()
        return mat

    def __getAllParents(self, jointObj, li):
        if not jointObj.isNull():
            fnDagNode = om.MFnDagNode(jointObj)
            if fnDagNode.parentCount() > 0:
                parentObj = fnDagNode.parent(0)
                parent = om.MFnTransform(parentObj)
                try:
                    parent.name()
                    li.append(parent)
                    self.__getAllParents(parentObj, li)
                except:
                    pass