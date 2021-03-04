#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/6/8 20:37
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @Software: PyCharm


import jointChain
reload(jointChain)
from maya import cmds as mc
from maya.api import OpenMaya as om


class IKSolver:
    SprintSolver = 'ikSplineSolver'
    SingleChainSolver = 'ikSCsolver'
    RotatePlaneSolver = 'ikRPsolver'


class IKJointChain(jointChain.JointChain):
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
        # Step 1 Start
        # create toe ik handle then group as foot grp
        toeEndHandle = self.__createIKHandle(self._jointChain[4],
                                             self._jointChain[5],
                                             IKSolver.SingleChainSolver,
                                             self.uuid('toeEnd'))

        # 2. create foot controller
        footCtl = self._group2Ctl([toeEndHandle], self._jointChain[4], 'toeEnd_au_Grp', 'foot_Ctl')
        footGrp = self.uuid('foot_Grp')
        self._group([footCtl], self._jointChain[4], footGrp)
        # Step 1 End

        # Step 2 Start
        # 2.1
        # create ankle ik handle and foot ik handle then group them together
        ankleHandle = self.__createIKHandle(self._jointChain[0],
                                            self._jointChain[2],
                                            IKSolver.RotatePlaneSolver,
                                            self.uuid('ankle'))

        poleVectorCtl, poleVectorGrp = self.__createPoleVectorCtl(ankleHandle)

        footHandle = self.__createIKHandle(self._jointChain[2],
                                           self._jointChain[3],
                                           IKSolver.SingleChainSolver,
                                           self.uuid('foot'))

        ankleAuCtl = self._group2Ctl([ankleHandle, footHandle], self._jointChain[3], 'ankle_au_Grp', 'ankle_Ctl')
        ankleGrp = self.uuid('ankle_Grp')
        self._group([ankleAuCtl], self._jointChain[3], ankleGrp)
        mc.aimConstraint(poleVectorCtl, ankleGrp, maintainOffset=True, weight=1.0)

        # 2.2
        # create toe ik handle then group with ankle_Grp together
        toeHandle = self.__createIKHandle(self._jointChain[3],
                                          self._jointChain[4],
                                          IKSolver.SingleChainSolver,
                                          self.uuid('toe'))

        toeCtl = self._group2Ctl([toeHandle, ankleGrp], self._jointChain[4], 'toe_au_Grp', 'toe_Ctl')
        toeExtraGrp = self.uuid('toe_extra_Grp')
        self._group([toeCtl], self._jointChain[4], toeExtraGrp)
        mc.pointConstraint(footCtl, toeExtraGrp, maintainOffset=True, weight=1.0)

        toeGrp = self.uuid('toe_Grp')
        self._group([toeExtraGrp], self._jointChain[4], toeGrp)
        # Step 2 End

        # Step 3 Start
        # create inside roll
        aabb = self._aabb(footCtl)
        cp = [(aabb[0] + aabb[3])/2.0, (aabb[1] + aabb[4])/2.0, (aabb[2] + aabb[5])/2.0]
        insidePos = [cp[0] + (aabb[3] - aabb[0])/2.0, aabb[1], cp[2]]
        insideRollGrp = self.uuid('inside_roll')
        self._group([footGrp, toeGrp], insidePos, insideRollGrp)

        # create outside roll
        outsideRollGrp = self.uuid('outside_roll')
        outsidePos = [cp[0] - (aabb[3] - aabb[0]) / 2.0, aabb[1], cp[2]]
        self._group([insideRollGrp], outsidePos, outsideRollGrp)

        # create backward roll
        backwardRollGrp = self.uuid('backward_roll')
        backwardPos = [cp[0], aabb[1], aabb[2]]
        self._group([outsideRollGrp], backwardPos, backwardRollGrp)

        # create forward roll
        forwardRollGrp = self.uuid('forward_roll')
        forwardPos = [cp[0], aabb[1], aabb[5]]
        self._group([backwardRollGrp], forwardPos, forwardRollGrp)
        # Step 3 End

        # create root group
        ikGrp = self.uuid('ik_Grp')
        self._group([forwardRollGrp, poleVectorGrp], (0, 0, 0), ikGrp)

        # create expression
        self.__setExpression(footCtl, insideRollGrp, outsideRollGrp, forwardRollGrp, backwardRollGrp)

        return ikGrp

    def __createPoleVectorCtl(self, ankleHandle):
        poleVectorCtl = self.importCtl('pole_vector_Ctl')
        poleVectorGrp = self.uuid('pole_vector_Grp')
        mc.rename('pole_vector_Grp', poleVectorGrp)

        theta = 0.4
        if '_F_' in self._rootJointShortName or '_M_' in self._rootJointShortName:
            mc.setAttr(poleVectorCtl + '.scaleZ', -1)
            mc.makeIdentity(poleVectorCtl, apply=True, t=True, r=True, s=True, normal=0, preserveNormals=True)
            theta = 0.8
        # make sure the poleVectorCtl on the same plane of ankle joint chain
        p0 = om.MVector(mc.xform(self._jointChain[0], q=True, t=True, ws=True))
        p1 = om.MVector(mc.xform(self._jointChain[1], q=True, t=True, ws=True))
        p2 = om.MVector(mc.xform(self._jointChain[2], q=True, t=True, ws=True))

        d0 = om.MVector(p1 - p0).normal()
        d1 = om.MVector(p1 - p2).normal()

        pos = p2 + (d0 + d1) * theta

        self._move(poleVectorGrp, [pos.x, pos.y, pos.z], False)

        # link pole vector start point to the ankle joint
        curveCtl = self.uuid('curveCtl')
        mc.curve(n=curveCtl, degree=1, p=[(0, 0, 0), (0, 0, 0)])

        clusterStartHandle = mc.cluster('%s.cv[0]' % curveCtl, n=self.uuid('clusterStart'), envelope=1)
        mc.pointConstraint(ankleHandle, clusterStartHandle, offset=(0, 0, 0), weight=1.0)

        clusterEndHandle = mc.cluster('%s.cv[1]' % curveCtl, n=self.uuid('clusterEnd'), envelope=1)
        mc.pointConstraint(poleVectorCtl, clusterEndHandle, offset=(0, 0, 0), weight=1.0)

        mc.makeIdentity(poleVectorGrp, apply=True, t=True, r=True, s=True, normal=0, preserveNormals=True)

        mc.parent(clusterStartHandle, clusterEndHandle, curveCtl, poleVectorGrp)

        return poleVectorCtl, poleVectorGrp

    def __createIKHandle(self, startJoint, endJoint, solver, name):
        """
        :param startJoint:
        :param endJoint:
        :param solver:
        :return: ikHandle name, effector name
        """
        ikHandle, effect = mc.ikHandle(startJoint=startJoint, endEffector=endJoint, solver=solver)

        ikHandleName = 'ikh_' + name
        mc.rename(ikHandle, ikHandleName)

        effectName = 'eft_' + name
        mc.rename(effect, effectName)

        # return ikHandleName, effectName
        return ikHandleName

    def __setExpression(self,
                        footCtl,
                        insideRollGrp,
                        outsideRollGrp,
                        forward_roll,
                        backward_roll):
        expression = """
        if (footCtl.side < 0.0) 
            insideRollGrp.rotateZ = footCtl.side;
        else
            insideRollGrp.rotateZ = 0.0;

        if (footCtl.side > 0.0) 
            outsideRollGrp.rotateZ = footCtl.side;
        else
            outsideRollGrp.rotateZ = 0.0;
        
        if (footCtl.roll < 0.0)
            backward_roll.rotateX = footCtl.roll;
        else
            backward_roll.rotateX = 0.0;
        
        if (footCtl.roll > 0.0)
            forward_roll.rotateX = footCtl.roll;
        else
            forward_roll.rotateX = 0.0;
            
        forward_roll.rotateY = footCtl.rotY;    
        """.replace('footCtl', footCtl).\
            replace('insideRollGrp', insideRollGrp).\
            replace('outsideRollGrp', outsideRollGrp).\
            replace('forward_roll', forward_roll).\
            replace('backward_roll', backward_roll)

        mc.expression(s=expression, object=footCtl, alwaysEvaluate=1, unitConversion='all')

    @property
    def _jointChainType(self):
        return 'ik'
