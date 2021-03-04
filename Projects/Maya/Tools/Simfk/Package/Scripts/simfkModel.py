#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2021/01/05
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : simfkModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial
from maya.api import OpenMaya as om
from maya import cmds as mc
from Red9.core.Red9_Meta import getMetaNodes


class SimfkModel(Model):
    skin_joint_chain = ['beakReflex_01', 'beakReflex_02', 'beakReflex_03', 'beakReflex_04', 'beakReflex_05']
    fk_joint_chain = ['Fk_beakReflex_01', 'Fk_beakReflex_02', 'Fk_beakReflex_03', 'Fk_beakReflex_04', 'Fk_beakReflex_05']
    fk_ctl = ['Fk_beakReflex_01_Ctl', 'Fk_beakReflex_02_Ctl', 'Fk_beakReflex_03_Ctl', 'Fk_beakReflex_04_Ctl', 'Fk_beakReflex_05_Ctl']
    reflex_joint_chain = ['beakReflex_01_bake', 'beakReflex_02_bake', 'beakReflex_03_bake', 'beakReflex_04_bake']
    beak_reflex_target = 'C_Fk_jaw_Ctl'
    attributes = ['leftBeakParentConstraint',
                  'rightBeakParentConstraint']

    def lateInit(self, **kwargs):
        super(SimfkModel, self).lateInit(**kwargs)
        # self.add_extra_attribute()
        # self.create_joint_chain()
        self.attribute_changed_callback()

    def create_joint_chain(self):
        """
        Right now there is fk chain already
        :return:
        """
        left_skin_joint_chain = ['L_' + obj for obj in self.skin_joint_chain]
        left_fk_joint_chain = ['L_' + obj for obj in self.fk_joint_chain]
        left_reflex_joint_chain = ['L_' + obj for obj in self.reflex_joint_chain]
        left_fk_ctl = ['L_' + obj for obj in self.fk_ctl]
        left_parent_constraints = self.side_joint_chain(left_skin_joint_chain,
                                                        left_fk_joint_chain,
                                                        left_reflex_joint_chain,
                                                        left_fk_ctl)

        right_skin_joint_chain = ['R_' + obj for obj in self.skin_joint_chain]
        right_fk_joint_chain = ['R_' + obj for obj in self.fk_joint_chain]
        right_reflex_joint_chain = ['R_' + obj for obj in self.reflex_joint_chain]
        right_fk_ctl = ['R_' + obj for obj in self.fk_ctl]
        right_parent_constraints = self.side_joint_chain(right_skin_joint_chain,
                                                         right_fk_joint_chain,
                                                         right_reflex_joint_chain,
                                                         right_fk_ctl)

        # self.record_attribute('leftBeakSkinJointChain', left_skin_joint_chain)
        # self.record_attribute('leftBeakReflexJointChain', left_reflex_joint_chain)
        # self.record_attribute('leftBeakFKJointChain', left_fk_joint_chain)
        # self.record_attribute('leftBeakCtl', left_fk_ctl)
        self.record_attribute('leftBeakParentConstraint', left_parent_constraints)

        # self.record_attribute('rightBeakSkinJointChain', right_skin_joint_chain)
        # self.record_attribute('rightBeakReflexJointChain', right_reflex_joint_chain)
        # self.record_attribute('rightBeakFKJointChain', right_fk_joint_chain)
        # self.record_attribute('rightBeakCtl', right_fk_ctl)
        self.record_attribute('rightBeakParentConstraint', right_parent_constraints)

    def add_extra_attribute(self):
        current_attributes = mc.attributeInfo(self.beak_reflex_target, all=True)
        for attr in self.attributes:
            if attr in current_attributes:
                continue
            else:
                mc.addAttr(self.beak_reflex_target, ln=attr, dt='string')

    @classmethod
    def disconnect_attr(cls, source, dest, attr):
        dests = mc.connectionInfo('%s.%s' % (source, attr), destinationFromSource=True)
        if dest in dests:
            mc.disconnectAttr('%s.%s' % (source, attr), '%s.%s' % (dest, attr))

    @classmethod
    def side_joint_chain(cls, skin_joint_chain, fk_joint_chain, reflex_joint_chain, fk_ctl):
        for i in range(len(reflex_joint_chain)):
            cls.disconnect_attr(reflex_joint_chain[i], skin_joint_chain[i], 'rotateX')
            cls.disconnect_attr(reflex_joint_chain[i], skin_joint_chain[i], 'rotateY')
            cls.disconnect_attr(reflex_joint_chain[i], skin_joint_chain[i], 'rotateZ')

        for i in range(len(skin_joint_chain)):
            cls.disconnect_attr(fk_joint_chain[i], skin_joint_chain[i], 'translate')
            cls.disconnect_attr(fk_joint_chain[i], skin_joint_chain[i], 'rotate')

        parent_constraints = list()
        for i in range(len(fk_joint_chain)):
            if i >= len(reflex_joint_chain):
                pc = list(set(mc.listConnections(fk_joint_chain[i], s=True, type='parentConstraint')))[0]
                li = [pc, skin_joint_chain[i], fk_ctl[i], '%sW0' % fk_joint_chain[i]]
            else:
                mc.select(fk_joint_chain[i], r=True)
                mc.select(reflex_joint_chain[i], add=True)
                mc.select(skin_joint_chain[i], tgl=True)
                pc = mc.parentConstraint(mo=True, weight=1)[0]
                li = [pc, skin_joint_chain[i], fk_ctl[i], '%sW0' % fk_joint_chain[i], '%sW1' % reflex_joint_chain[i]]

            mc.setAttr('%s.%sW0' % (pc, fk_joint_chain[i]), 0)
            parent_constraints.append(li)

        return parent_constraints

    def attribute_changed_callback(self, *args):
        """
        This callback will be invoked after open animation file
        :param args:
        :return:
        """
        meta_nodes = getMetaNodes(mTypes='MsvMetaRig')
        is_tetrapteron = False
        namespace = ''
        if meta_nodes:
            for obj in meta_nodes:
                if obj.rigName == 'Tetrapteron':
                    is_tetrapteron = True
                    namespace = obj.nameSpaceFull()
                    break

        if not is_tetrapteron:
            return

        def string_to_list(long_string):
            li = list()
            for data in long_string.split(';'):
                if data:
                    tmp = [d for d in data.split(',') if d]
                    li.append(tmp)
            return li

        def update_transform(datas):
            """
            :param datas:
            L_beakReflex_01_parentConstraint1,L_beakReflex_01,L_Fk_beakReflex_01_Ctl,L_Fk_beakReflex_01W0,L_beakReflex_01_bakeW1;
            L_beakReflex_05_parentConstraint1,L_beakReflex_05,L_Fk_beakReflex_05_Ctl,L_Fk_beakReflex_05W0;
            :return:
            """
            matrices = list()
            for i in range(len(datas)):
                skin_joint = datas[i][1]
                matrix = mc.xform('%s:%s' % (namespace, skin_joint), q=True, ws=True, m=True)
                matrices.append(matrix)

            for i in range(len(datas)):
                fk_ctl = datas[i][2]
                mc.xform('%s:%s' % (namespace, fk_ctl), m=matrices[i], ws=True)

        def switch_constraint(datas, index):
            """
            :param datas:
            L_beakReflex_01_parentConstraint1,L_beakReflex_01,L_Fk_beakReflex_01_Ctl,L_Fk_beakReflex_01W0,L_beakReflex_01_bakeW1;
            L_beakReflex_05_parentConstraint1,L_beakReflex_05,L_Fk_beakReflex_05_Ctl,L_Fk_beakReflex_05W0;
            :param index:
            :return:
            """
            constraint = datas[0]
            if index == 0:
                mc.setAttr('%s:%s.%s' % (namespace, constraint, datas[3]), 0)
                if len(datas) == 5:
                    mc.setAttr('%s:%s.%s' % (namespace, constraint, datas[4]), 1)
            elif index == 1:
                mc.setAttr('%s:%s.%s' % (namespace, constraint, datas[3]), 1)
                if len(datas) == 5:
                    mc.setAttr('%s:%s.%s' % (namespace, constraint, datas[4]), 0)

        def switch(index, node_name):
            """
            :param index: 0: sim, 1: fk
            :param node_name:
            :return:
            """
            left_parent_constraint_list = string_to_list(mc.getAttr(node_name + '.leftBeakParentConstraint'))
            right_parent_constraint_list = string_to_list(mc.getAttr(node_name + '.rightBeakParentConstraint'))

            if index == 1:
                update_transform(left_parent_constraint_list)
                update_transform(right_parent_constraint_list)

            for data in left_parent_constraint_list:
                switch_constraint(data, index)
            for data in right_parent_constraint_list:
                switch_constraint(data, index)

        def change_simfk(msg, m_plug, other_msg, client_data):
            """
            # msg  kIncomingDirection = 2048
            # msg  kAttributeSet = 8
            # 2048 + 8 = 2056
            :param msg:
            :param m_plug:
            :param other_msg:
            :param client_data:
            :return:
            """
            if msg == 2056:
                if m_plug.partialName() == 'simfk':
                    node = om.MFnDependencyNode(m_plug.node())
                    index = node.findPlug('simfk', False).asInt()
                    switch(index, node.name())

        li = om.MSelectionList()
        li.add('%s:%s' % (namespace, self.beak_reflex_target))
        obj = li.getDependNode(0)

        # remove previous callbacks
        ids = om.MNodeMessage.nodeCallbacks(obj)
        om.MNodeMessage.removeCallbacks(ids)

        # add new one
        om.MNodeMessage.addAttributeChangedCallback(obj, change_simfk)

    def active_fk_chain(self, active):
        if active:
            left_fk_ctl = ['L_' + obj for obj in self.fk_ctl]
            left_skin_joint_chain = ['L_' + obj for obj in self.skin_joint_chain]
            for i in range(len(left_fk_ctl)):
                mc.setAttr(left_fk_ctl[i] + '.visibility', 1)
                matrix = mc.xform(left_skin_joint_chain[i], q=True, ws=True, m=True)
                mc.xform(left_fk_ctl[i], m=matrix, ws=True)

    def record_attribute(self, attr, datas):
        long_string = ''
        for data in datas:
            long_string += ','.join(data) + ';'
        mc.setAttr('%s.%s' % (self.beak_reflex_target, attr), long_string, type='string')



