#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/6/8 20:36
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @Software: PyCharm


import jointChain
reload(jointChain)
from maya import cmds as mc


class FKJointChain(jointChain.JointChain):
    def _setup(self):
        """
        :return: the joint chain hierarchy must be:
        [0]: upper leg
        [1]:     |-lower leg
        [2]:         |-ankle
        [3]:             |-foot
        [4]:                 |-toe
        [5]                    |-toe end
        """
        parent = None
        child = None
        for i in reversed(range(len(self._jointChain)-1)):
            if child:
                parent = self.__createCon(self._jointChain[i], self._jointChain[i+1])
            else:
                child = self.__createCon(self._jointChain[i], self._jointChain[i+1])
            if parent:
                mc.parent(child, parent)
                child = parent

        # group them all
        fkGrp = self.uuid('fk_Grp')
        self._group([parent], (0, 0, 0), self.uuid('fk_Grp'))
        return fkGrp

    def __createCon(self, fkJointCur, fkJointNext):
        # create controller
        controllerName = fkJointCur.split('|')[-1] + '_Ctl'
        fkCtl = self.importCtl('fk_Ctl')
        mc.rename(fkCtl, controllerName)

        posCur = mc.xform(fkJointCur, q=True, t=True, ws=True)
        self._move(controllerName, posCur, False)

        posNext = mc.xform(fkJointNext, q=True, t=True, ws=True)
        angle = mc.angleBetween(v1=(0, 1, 0), v2=(posNext[0]-posCur[0], posNext[1]-posCur[1], posNext[2]-posCur[2]), euler=True)

        mc.rotate(angle[0], angle[1], angle[2], [controllerName], os=True)

        # freeze
        mc.makeIdentity(controllerName, apply=True, t=True, r=True, s=True, normal=0, preserveNormals=True)

        mc.parentConstraint(controllerName, fkJointCur, maintainOffset=True, weight=1.0)
        return controllerName

    @property
    def _jointChainType(self):
        return 'fk'
