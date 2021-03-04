#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/01/08
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : ragdollToolModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from maya import cmds as mc


class RagdollToolModel(Model):
    def lateInit(self, **kwargs):
        super(RagdollToolModel, self).lateInit(**kwargs)

        self._attribute_dict = {'rigid_body': {'attrs': ['mass', 'friction', 'restitution'],
                                               'objects': mc.ls(type='hkNodeRigidBody')},
                                'ragdoll_constraint': {'attrs': ['maxFrictionTorque'],
                                                       'objects': mc.ls(type='hkNodeRagDollConstraint') +
                                                                  mc.ls(type='hkNodeHingeConstraint')}}

    def ragdoll_parameters(self, key, value):
        for node_type, di in self._attribute_dict.items():
            if key in di['attrs']:
                for obj in di['objects']:
                    mc.setAttr(obj + '.' + key, value)
