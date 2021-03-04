#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/6/8 20:35
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @Software: PyCharm


from maya import cmds as mc
from Common.Functions.implement import abstract
from abc import ABCMeta, abstractmethod, abstractproperty
import os


class JointChain(object):
    def __init__(self, startJointName, endJointName):
        self._startJointName = startJointName
        self._endJointName = endJointName

        _skinJointList = list()
        self._skinJointList = list()
        self._getAllChildren(self._startJointName, _skinJointList, 'joint')
        for i in range(len(_skinJointList)):
            self._skinJointList.append(_skinJointList[i])
            if _skinJointList[i].split('|')[-1] == self._endJointName:
                break

        self._jointChain = self._createJointChain(self._skinJointList, self._jointChainType)
        self._rootJointShortName = self._jointChain[0].split('|')[-1]

        self._controller = self._setup()

    @property
    def _jointChainType(self): abstract()

    @property
    def _setup(self): abstract()

    @property
    def controller(self):
        return self._controller

    @property
    def jointChain(self):
        return self._jointChain

    @property
    def skinJointChain(self):
        return self._skinJointList

    def uuid(self, id):
        uuid = self._rootJointShortName + '_' + id
        if not hasattr(self, uuid):
            setattr(self, uuid, uuid)
        return getattr(self, uuid)

    def importCtl(self, ctlName):
        path = os.path.join(os.path.split(__file__)[0], '../../MayaFiles/Ctls/%s.fbx' % ctlName)
        mc.file(path, i=True, rpr=':', force=True, prompt=True)

        uuid = self.uuid(ctlName)
        mc.rename(ctlName, uuid)

        # drawing overrides
        shapes = mc.listRelatives(uuid, s=True, c=True, f=True)
        if shapes:
            mc.setAttr(shapes[0] + '.overrideEnabled', True)
            # left: blue, right: green
            if self._rootJointShortName.startswith('|L_') or self._rootJointShortName.startswith('L_'):
                mc.setAttr(shapes[0] + '.overrideColor', 6)
            elif self._rootJointShortName.startswith('|R_') or self._rootJointShortName.startswith('R_'):
                mc.setAttr(shapes[0] + '.overrideColor', 4)
        return uuid

    def _aabb(self, transform):
        minX = minY = minZ = 10000000
        maxX = maxY = maxZ = -10000000

        children = mc.listRelatives(transform, s=True, f=True)
        if children:
            if mc.nodeType(children[0]) == 'nurbsCurve':
                cpLen = mc.getAttr(children[0] + '.controlPoints', s=True)
                for i in range(cpLen):
                    cp = '%s.controlPoints[%s]' % (children[0], i)
                    pos = mc.xform(cp, q=True, t=True, ws=True)
                    if pos[0] <= minX:
                        minX = pos[0]
                    if pos[0] > maxX:
                        maxX = pos[0]

                    if pos[1] <= minY:
                        minY = pos[1]
                    if pos[1] > maxY:
                        maxY = pos[1]

                    if pos[2] <= minZ:
                        minZ = pos[2]
                    if pos[2] > maxZ:
                        maxZ = pos[2]

        return [minX, minY, minZ, maxX, maxY, maxZ]

    def _getAllChildren(self, parent, li, typeName):
        if mc.nodeType(parent) == typeName:
            li.append(parent)
        children = mc.listRelatives(parent, c=True, f=True)
        if children:
            for joint in children:
                self._getAllChildren(joint, li, typeName)

    def _createJointChain(self, skinJointList, jointChainType):
        jointShortName = skinJointList[0].split('|')[-1]
        grpName = '%s_%s_parentTransform' % (jointShortName, jointChainType)

        if not mc.objExists(grpName):
            mc.group(n=grpName, em=True)

            # using parent position & rotation
            parentNode = mc.listRelatives(jointShortName, p=True)[-1]
            pos = mc.xform(parentNode, q=True, t=True, ws=True)
            rotX = mc.getAttr(parentNode + '.jointOrientX')
            rotY = mc.getAttr(parentNode + '.jointOrientY')
            rotZ = mc.getAttr(parentNode + '.jointOrientZ')

            # using root position
            # pos = mc.xform(jointShortName, q=True, t=True, ws=True)

            mc.xform(grpName, t=pos, a=True, ws=True)
            mc.xform(grpName, ro=(rotX, rotY, rotZ), a=True, os=True)

            root = mc.duplicate(jointShortName, returnRootsOnly=True)
            mc.parent(root, grpName)

            l = list()
            self._getAllChildren(grpName, l, 'joint')

            for i in reversed(range(len(l))):
                if i < len(skinJointList):
                    tmp = skinJointList[i].split('|')[-1].split('_')
                    partName = tmp[0]
                    jointName = '_'.join(tmp[1:])
                    newName = '%s_%s_%s' % (partName, jointChainType, jointName)
                    mc.rename(l[i], newName)
                else:
                    mc.delete(l[i])

        skeletonGrpName = '%s_Skeleton_Grp' % jointShortName
        if not mc.objExists(skeletonGrpName):
            mc.select(cl=True)
            mc.group(name=skeletonGrpName, em=True)

        try:
            mc.parent(grpName, skeletonGrpName)
        except Exception as e:
            print e.message

        # after re group, get the full path name
        l = list()
        self._getAllChildren(grpName, l, 'joint')

        mc.setAttr(grpName+'.v', 0)
        return l

    def _move(self, object, dest, pivot=True):
        if isinstance(dest, list) or isinstance(dest, tuple):
            pos = dest
        else:
            pos = mc.xform(dest, q=True, t=True, ws=True)

        if pivot:
            mc.move(pos[0], pos[1], pos[2], [object + '.scalePivot', object + '.rotatePivot'], rotatePivotRelative=True)
        else:
            mc.move(pos[0], pos[1], pos[2], object, absolute=True)

    def _group(self, sourceNodes, dest, grpName):
        mc.select(cl=True)
        for node in sourceNodes:
            mc.select(node, add=True)
        mc.group(n=grpName)
        mc.select(cl=True)

        self._move(grpName, dest, True)

    def _group2Ctl(self, sourceNodes, dest, grpName, ctlName):
        grp = self.uuid(grpName)
        self._group(sourceNodes, dest, grp)

        ctl = self.importCtl(ctlName)
        self._move(ctl, dest, False)
        mc.makeIdentity(ctl, apply=True, t=True, r=True, s=True, normal=0, preserveNormals=True)

        mc.parent(grp, ctl)
        # mc.makeIdentity(ctl, apply=True, t=True, r=True, s=True, normal=0, preserveNormals=True)

        return ctl


