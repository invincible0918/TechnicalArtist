#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/23
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : refreshBindFileModel.py

import os
import difflib
from Core.MayaGUI.LitFrame.model import Model
from Red9.core.Red9_Meta import getMetaNodes
from maya import cmds as mc
from maya import mel as mm
from maya import OpenMaya as om


class RefreshBindFileModel(Model):
    def lateInit(self, **kwargs):
        super(RefreshBindFileModel, self).lateInit(**kwargs)

    def export_skeleton(self):
        self._export_skeleton()

    def update_bind(self, influence_association_method):
        self._update_skeleton_in_bind_file()
        meshes = self._bind_skin()
        self._reassign_skin_weight(meshes, influence_association_method)
        self._remove_reference()
        # self._remove_skeleton_file()

    def export(self):
        self._load_export_preset('bind_pose.fbxexportpreset')

        animal_name = os.path.splitext(os.path.basename(mc.file(q=True, sn=True)))[0].split('_')[0]
        self._export_bind_pose_path = os.path.join(mc.file(q=True, sn=True), '../../../../../characterart/wildlife/%s/wildlife_%s.fbx' % (animal_name, animal_name)).lower()

        dir_name = os.path.dirname(self._export_bind_pose_path)
        if not os.path.exists(dir_name):
            os.makedirs(dir_name)

        # remove read-only attribute
        os.chmod(self._export_bind_pose_path, 0777)
        mc.file(self._export_bind_pose_path, force=True, options='v=0;', typ='FBX export', pr=True, ea=True)

    def open(self):
        if self._export_bind_pose_path:
            os.startfile(os.path.dirname(self._export_bind_pose_path))

    @classmethod
    def _get_root_bone(cls):
        meta_nodes = getMetaNodes(mTypes='MsvMetaRig')
        if meta_nodes:
            for obj in meta_nodes:
                return obj.get_export_root()

        return None

    @classmethod
    def _export_skeleton(cls):
        root_bone = cls._get_root_bone()
        output_grp = mc.listRelatives(root_bone, p=True, f=True)[0]
        children = mc.listRelatives(output_grp, c=True, f=True)
        mc.select(cl=True)
        for child in children:
            mc.select(child, add=True)
        mc.select(hierarchy=True)

        joints = list()
        for joint in mc.ls(sl=True, type='joint'):
            joints.append(joint)

        mc.select(cl=True)
        for joint in joints:
            mc.select(joint, add=True)

        cls._load_export_preset('export_joint.fbxexportpreset')

        mc.file(cls._tmp_joint_file_path(), force=True, options='v=0;', typ='FBX export', pr=True, es=True)
        mc.select(cl=True)

    @classmethod
    def _load_export_preset(cls, fbxexportpreset):
        preset_file_path = os.path.join(os.path.split(__file__)[0], 'FBX', fbxexportpreset)
        cmd = ('FBXLoadExportPresetFile -f "%s"' % preset_file_path).replace('\\', '/')
        mm.eval(cmd)

    @classmethod
    def _update_skeleton_in_bind_file(cls):
        # remove read-only attribute
        os.chmod(cls._bind_file_path(), 0777)

        joints = mc.ls(type='joint')
        for i in range(len(joints)):
            if mc.objExists(joints[i]):
                mc.delete(joints[i])

        mc.file(cls._tmp_joint_file_path(), i=True, ns=':')
        for child in mc.listRelatives('output_Grp', c=True):
            mc.parent(child, w=True)
        mc.delete('main_Grp')

        for joint in mc.ls(type='joint'):
            mc.setAttr(joint+'.rx', 0)
            mc.setAttr(joint+'.ry', 0)
            mc.setAttr(joint+'.rz', 0)
            mc.setKeyframe(joint)

    @classmethod
    def _bind_skin(cls):
        meshes = mc.ls(type='mesh')
        dest_meshes = list()
        for mesh in meshes:
            parent = mc.listRelatives(mesh, p=True)[0]
            if parent not in dest_meshes:
                dest_meshes.append(parent)
                mc.skinCluster('C_pelvis', parent)

        return dest_meshes

    @classmethod
    def _reassign_skin_weight(cls, dest_meshes, influence_association_method):
        animal_name = os.path.splitext(os.path.basename(mc.file(q=True, sn=True).lower()))[0].split('_')[0]
        mc.file(cls._rig_file_path(), r=True, ns='_tmp__')

        for source in mc.listRelatives('_tmp__:dummy_Grp', c=True):
            if not mc.getAttr(source + '.v'):
                continue

            cmp_source = source.lower().replace('_', '').replace(':', '').replace(animal_name.lower(), '')
            ratio = 0
            dest = None
            for _dest in dest_meshes:
                cmp_dest = _dest.lower().replace('_', '').replace(':', '').replace(animal_name.lower(), '')
                _ratio = difflib.SequenceMatcher(None, cmp_source, cmp_dest).quick_ratio()
                if _ratio > ratio:
                    ratio = _ratio
                    dest = _dest

            mc.select(cl=True)
            mc.select(source, add=True)
            mc.select(dest, add=True)
            try:
                mel_command = 'copySkinWeights  -noMirror -surfaceAssociation closestPoint -influenceAssociation %s -influenceAssociation %s -influenceAssociation %s' % (influence_association_method, influence_association_method, influence_association_method)
                mm.eval(mel_command)
            except Exception as e:
                print '\n\t%s' % e.message
            mc.select(cl=True)

    @classmethod
    def _remove_reference(cls):
        reference_path = cls._rig_file_path()
        reference_node = mc.referenceQuery(reference_path, rfn=True)

        if reference_node and mc.objExists(reference_node):
            om.MFileIO.unloadReferenceByNode(reference_node)

        if reference_path and os.path.exists(reference_path):
            om.MFileIO.removeReference(reference_path)

        mc.refresh(force=True)

    @classmethod
    def _remove_skeleton_file(cls):
        os.remove(cls._tmp_joint_file_path())

    @classmethod
    def _rig_file_path(cls):
        return mc.file(q=True, sn=True).lower().replace('_bind.ma', '_rig.ma')

    @classmethod
    def _bind_file_path(cls):
        return mc.file(q=True, sn=True).lower().replace('_rig.ma', '_bind.ma')

    @classmethod
    def _tmp_joint_file_path(cls):
        return os.path.join(os.path.dirname(os.path.split(__file__)[0]), '_tmp_joint.fbx')


