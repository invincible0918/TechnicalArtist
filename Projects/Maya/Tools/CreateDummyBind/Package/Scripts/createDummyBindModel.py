#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/11/18
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : createDummyBindModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial
from maya import cmds as mc


class JointNode(object):
    Joint = None
    Transform = None
    Vertex_count = None

    def __init__(self, transform):
        self.Transform = transform

        shape_node = mc.listRelatives(transform, shapes=True)[0]
        self.Vertex_count = mc.polyEvaluate(shape_node, vertex=True)

        self.Joint = mc.listRelatives(transform, p=True, type='joint')[0]


class CreateDummyBindModel(Model):
    def lateInit(self, **kwargs):
        super(CreateDummyBindModel, self).lateInit(**kwargs)

        self.root = 'C_root'
        self.combined_node = None
        self.joint_nodes = list()

        self.visible_mesh()
        self.bind_dummy_skeleton()
        # self.reparent()
        # self.combine()
        # self.bind_skin()

    def visible_mesh(self):
        for mesh in mc.ls(type='transform'):
            children = mc.listRelatives(mesh, c=True, type='mesh')
            if children:
                try:
                    mc.setAttr(mesh+'.overrideEnabled', 0)
                except Exception as e:
                    print e.message

    def bind_dummy_skeleton(self):
        for jnt in mc.ls(type='joint'):
            if jnt.startswith('Low_'):
                skin_joint = jnt.replace('Low_', '')
                if mc.objExists(skin_joint):
                    mc.parentConstraint([skin_joint, jnt], mo=True, weight=True)

    def combine(self):
        children = [child for child in mc.listRelatives(self.root, allDescendents=True) if mc.nodeType(child) == 'transform']

        nodes = list()
        self.joint_nodes = []

        for child in children:
            nodes.append(child)
            self.joint_nodes.append(JointNode(child))

            mc.parent(child, w=True)
        self.combined_node = mc.polyUnite(nodes, ch=False)[0]

    def bind_skin(self):
        skin_cluster = mc.skinCluster(self.root, self.combined_node, maximumInfluences=1)[0]

        vertex_index = 0
        for node in self.joint_nodes:
            # print node.Joint
            # print vertex_index, vertex_index + node.Vertex_count - 1
            mc.select('%s.vtx[%i: %i]' % (self.combined_node, vertex_index, vertex_index + node.Vertex_count - 1))
            mc.skinPercent(skin_cluster, transformValue=[(node.Joint, 1)])

            vertex_index += node.Vertex_count

        mc.select(cl=True)

    def reparent(self):
        root = 'C_root'
        children = [child for child in mc.listRelatives(root, allDescendents=True) if mc.nodeType(child) == 'transform']
        for child in children:
            parent = mc.listRelatives(child, parent=True)[0]
            dest_joint = 'Low_' + parent
            if mc.objExists(dest_joint):
                mc.parent(child, dest_joint)
            else:
                print dest_joint
