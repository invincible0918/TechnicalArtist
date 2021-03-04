#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 5/21/2019 10:28 AM
# @Author  : wen-long.mo@ubisoft.com
# @Site    : 
# @File    : jointChain.py
# @Software: PyCharm


from maya import cmds as mc
from Common.Functions.implement import abstract
from abc import ABCMeta, abstractmethod, abstractproperty


class JointChain(object):
    def __init__(self, sourceJointRoot, skinJointRoot, controllerRoot):
        self._controllerTypes = []
        self._sourceJointRoot = sourceJointRoot
        self._skinJointRoot = skinJointRoot
        self._controllerRoot = controllerRoot

    def generateSourceJointList(self):
        skinJointList = list()
        self._getJoints(self._skinJointRoot, skinJointList)

        sourceJointList = list()
        if mc.objExists(self._sourceJointRoot):
            self._iterJoints(self._sourceJointRoot, sourceJointList)

        return skinJointList, sourceJointList

    def createJointChain(self, skinJointList, sourceJointList):
        rootName = skinJointList[0].split('|')[-1]

        arr = rootName.split('_')
        sideName = arr[0]   # L, R
        posName = arr[1]    # F, M, B
        partName = '_'.join(arr[2:])

        grpName = '%s_%s_%s_%s_parentTransform' % (sideName, self._jointChainType, posName, partName)

        l = list()
        if not mc.objExists(grpName):
            mc.group(n=grpName, em=True)

            # using parent position
            pos = mc.xform(mc.listRelatives(rootName, p=True)[-1], q=True, t=True, ws=True)

            # using root position
            pos = mc.xform(rootName, q=True, t=True, ws=True)

            mc.xform(grpName, t=pos, a=True, ws=True)

            root = mc.duplicate(rootName, returnRootsOnly=True)
            mc.parent(root, grpName)
            self._getJoints(grpName, l)

            for i in reversed(range(len(l))):
                if i >= len(sourceJointList):
                    mc.delete(l[i])
            l = l[0:len(sourceJointList)]

            for i in reversed(range(len(l))):
                sn = skinJointList[i].split('|')[-1]
                arr = sn.split('_')
                partName = '_'.join(arr[2:])
                newName = '%s_%s_%s_%s' % (sideName, self._jointChainType, posName, partName)
                mc.rename(l[i], newName)

                # l[i] = newName
                # remove all children if it's not a joint
                children = mc.listRelatives('|'.join(l[i].split('|')[:-1]) + '|' + newName, c=True, f=True)
                if children:
                    for j in reversed(range(len(children))):
                        if mc.nodeType(children[j]) != 'joint':
                            mc.delete(children[j])

        skeletonGrpName = '%s_Skeleton_Grp' % rootName
        if not mc.objExists(skeletonGrpName):
            mc.select(cl=True)
            mc.group(name=skeletonGrpName, em=True)

        mc.parent(grpName, skeletonGrpName)

        # after re group, get the full path name
        l = list()
        self._getJoints(grpName, l)
        mc.setAttr(grpName+'.v', 0)

        return l, grpName

    def getTransformSpace(self, controllers):
        def getParentConstraint(parent, li):
            if mc.nodeType(parent) == 'parentConstraint':
                li.append(parent)
            children = mc.listRelatives(parent, c=True, f=True)
            if children:
                for joint in children:
                    getParentConstraint(joint, li)

        transformSpace = dict()
        for controller in controllers:
            li = list()
            getParentConstraint(controller, li)
            print controller, li
            parentConstraintObj = mc.listConnections(li[0], c=True, s=True, d=False, t='parentConstraint')[1]
            sources = mc.listConnections(parentConstraintObj + '.target', c=True, s=True, d=False)
            parentObject = list()
            for i in range(0, len(sources), 2):
                if sources[i + 1] not in parentObject and mc.nodeType(sources[i + 1]) != 'parentConstraint':
                    parentObject.append(sources[i + 1])
            transformSpace[controller] = parentObject
        return transformSpace

    def generateDestJointList(self, sourceJointList, destJointList):
        if sourceJointList:
            destJointList = self._generateDatas(sourceJointList, destJointList)
        else:
            destJointList = list()

        return destJointList

    def parentConstraint(self, groupName):
        # parent constrain, joint chain's parent -> joint chain group
        parentJoint = mc.listRelatives(self._skinJointRoot, p=True, f=True, typ='joint')[0]
        mc.parentConstraint(parentJoint, groupName, mo=True, w=1)

    def breakAttr(self, destJointList):
        for i in range(len(destJointList)):
            data = destJointList[i]

            constrainAttrs = data['attrs']
            for j in range(len(constrainAttrs)):
                sp = constrainAttrs[j][0]
                dp = constrainAttrs[j][1]
                mc.disconnectAttr(sp, dp)

    def connectAttr(self, destJointList):
        newPathDict = dict()
        for i in range(len(destJointList)):
            data = destJointList[i]
            self.__parentConstrain(data['constraints'], data['destJoint'], newPathDict)

        for i in range(len(destJointList)):
            data = destJointList[i]

            for j in range(len(data['attrs'])):
                sp = data['attrs'][j][0]
                dp = data['attrs'][j][1]

                sourceJointShortName = data['sourceJoint'].split('|')[-1]
                destJointShortName = data['destJoint'].split('|')[-1]

                spArr = sp.split('.')
                dpArr = dp.split('.')

                if sourceJointShortName == spArr[0].split('|')[-1]:
                    sp = data['destJoint'] + '.' + spArr[1]
                elif sourceJointShortName == dpArr[0].split('|')[-1]:
                    dp = data['destJoint'] + '.' + dpArr[1]

                for k, v in newPathDict.items():
                    if k == spArr[0]:
                        sp = v + '.' + spArr[1]
                        break
                    elif k == dpArr[0]:
                        dp = v + '.' + dpArr[1]
                        break

                if sp.split('.')[-1] == 'parentMatrix':
                    sp += '[0]'

                mc.connectAttr(sp, dp, f=True)

    def __parentConstrain(self, controllers, destJoint, di):
        for controller in controllers:
            mc.setAttr(controller+'.rx', 0)
            mc.setAttr(controller+'.ry', 0)
            mc.setAttr(controller+'.rz', 0)
            mc.parent(controller, destJoint)

            di[controller] = '%s|%s' % (destJoint, controller.split('|')[-1])

    def _getJoints(self, parent, li):
        if mc.nodeType(parent) == 'joint':
            li.append(parent)
        children = mc.listRelatives(parent, c=True, f=True)
        if children:
            for joint in children:
                self._getJoints(joint, li)

    def _getConnectAttr(self, parentJoint):
        attrs = list()

        sources = mc.listConnections(parentJoint, c=True, p=True, s=True, d=False)
        dests = mc.listConnections(parentJoint, c=True, p=True, s=False, d=True)

        if sources:
            for i in range(0, len(sources), 2):
                if sources[i+1].split('.')[-1] != 'scale':
                    attrs.append((sources[i+1], sources[i]))

        if dests:
            for i in range(0, len(dests), 2):
                if dests[i].split('.')[-1] != 'scale':
                    attrs.append((dests[i], dests[i+1]))

        return attrs

    def _getControllers(self, parentJoint):
        constraints = list()

        controllers = mc.listRelatives(parentJoint, c=True, f=True)
        if controllers:
            for controller in controllers:
                if mc.nodeType(controller) in self._controllerTypes:
                    constraints.append(controller)

        return constraints

    @abstractmethod
    def _iterJoints(self, parentJoint, li):
        pass

    @abstractmethod
    def _generateDatas(self, sourceJointList, destJointList):
        pass

    @abstractproperty
    def _jointChainType(self):
        return None
