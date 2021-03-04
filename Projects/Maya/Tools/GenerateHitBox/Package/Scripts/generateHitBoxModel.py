#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/23
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : generateHitBoxModel.py

import os
import jointData
reload(jointData)
from Core.MayaGUI.LitFrame.model import Model
from Red9.core.Red9_Meta import getMetaNodes
from maya import cmds as mc


class GenerateHitBoxModel(Model):
    def lateInit(self, **kwargs):
        super(GenerateHitBoxModel, self).lateInit(**kwargs)
        self._animal_name = os.path.basename(os.path.dirname(mc.file(q=True, sn=True))).lower()
        self._jointList = list()

    def _write(self):
        path = os.path.join(os.path.dirname(mc.file(q=True, sn=True)), '%s.hitbox' % self._animal_name)
        with open(path, 'w') as f:
            f.write('{\n')
            f.writelines([joint.data for joint in self._jointList if mc.objExists(joint.cube_name)])
            f.write('}')
        return path

    def generate(self):
        meta_nodes = getMetaNodes(mTypes='MsvMetaRig')
        root_bone = meta_nodes[0].get_export_root()
        if meta_nodes:
            joints = [joint for joint in meta_nodes[0].get_export_joints() if not mc.getAttr(joint+'.isEnd')]
            for i in range(len(joints)):
                if not joints[i].startswith(root_bone):
                    continue

                joint = jointData.JointData(joints[i], i)
                if joint.is_hit_box_model:
                    self._jointList.append(joint)

    def delete(self):
        for jnt in self._jointList:
            if mc.objExists(jnt.cube_name):
                mc.delete(jnt.cube_name)

    def save(self):
        path = self._write()
        self._sendMessage('log', path)





