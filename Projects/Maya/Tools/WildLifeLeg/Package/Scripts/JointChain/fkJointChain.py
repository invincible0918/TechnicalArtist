#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 5/21/2019 10:28 AM
# @Author  : invincible0918@126.com
# @Site    : 
# @File    : fkJointChain.py
# @Software: PyCharm


from maya import cmds as mc
import jointChain
reload(jointChain)


class FKJointChain(jointChain.JointChain):
    def __init__(self, sourceJointRoot, skinJointRoot, controllerRoot):
        super(FKJointChain, self).__init__(sourceJointRoot, skinJointRoot, controllerRoot)
        self._controllerTypes = ['parentConstraint']

    @property
    def _jointChainType(self):
        return 'Fk'

    def _iterJoints(self, parentJoint, li):
        children = mc.listRelatives(parentJoint, c=True, f=True, type='joint')

        d = dict()
        d['sourceJoint'] = parentJoint
        d['attrs'] = self._getConnectAttr(parentJoint)
        d['constraints'] = self._getControllers(parentJoint)

        li.append(d)

        if children:
            for joint in children:
                self._iterJoints(joint, li)

    def _generateDatas(self, sourceList, destList):
        li = list()
        for i in range(len(sourceList)):
            data = dict(sourceList[i])
            data['destJoint'] = destList[i]
            li.append(data)

        return li
