#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 5/21/2019 10:28 AM
# @Author  : wen-long.mo@ubisoft.com
# @Site    : 
# @File    : ikJointChain.py
# @Software: PyCharm


from maya import cmds as mc
import jointChain
reload(jointChain)


class IKJointChain(jointChain.JointChain):
    def __init__(self, sourceJointRoot, skinJointRoot, controllerRoot):
        super(IKJointChain, self).__init__(sourceJointRoot, skinJointRoot, controllerRoot)
        self._controllerTypes = ['ikEffector', 'orientConstraint']

    def relocateIKHandles(self, destJointList):
        for i in reversed(range(len(destJointList))):
            data = destJointList[i]

            if data['ikHandlePos']:
                mc.xform(data['ikHandle'], t=data['ikHandlePos'], ws=True, a=True)

    @property
    def _jointChainType(self):
        return 'Ik'

    def _iterJoints(self, parentJoint, li):
        children = mc.listRelatives(parentJoint, c=True, f=True, type='joint')

        d = dict()
        d['sourceJoint'] = parentJoint
        d['attrs'] = self._getConnectAttr(parentJoint)
        d['constraints'] = self._getControllers(parentJoint)

        ikHandleConnection = mc.listConnections(parentJoint+'.message', c=True, s=False, d=True)
        if ikHandleConnection and mc.nodeType(ikHandleConnection[1]) == 'ikHandle':
            endEffector = mc.listConnections(ikHandleConnection[1] + '.endEffector', c=True, s=True, d=False)
            endJoint = mc.listConnections(endEffector[1] + '.translateX', c=True, s=True, d=False)

            d['ikHandle'] = ikHandleConnection[1]
            d['ikEndJoint'] = endJoint[1]
        else:
            d['ikHandle'] = None
            d['ikEndJoint'] = None

        li.append(d)

        if children:
            for joint in children:
                self._iterJoints(joint, li)

    def _generateDatas(self, sourceList, destList):
        li = list()
        for i in range(len(sourceList)):
            data = dict(sourceList[i])
            data['destJoint'] = destList[i]
            data['ikHandlePos'] = None
            li.append(data)

        # before re bind attribute, we need to record dest joint position
        for data in li:
            if data['ikHandle'] and data['ikEndJoint']:
                for _data in li:
                    sourceJointShortName = _data['sourceJoint'].split('|')[-1]
                    if data['ikEndJoint'] == sourceJointShortName:
                        data['ikHandlePos'] = mc.xform(_data['destJoint'], q=True, t=True, ws=True)
                        break
        return li
