#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/04/29
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : mirrorAnimModel.py


from Core.MayaGUI.LitFrame.model import Model
from maya import cmds as mc
from maya.api import OpenMaya as om
from Red9.core.Red9_Meta import getMetaNodes


class MirrorAnimModel(Model):
    rotation_order = {1: om.MEulerRotation.kXYZ,
                      2: om.MEulerRotation.kXZY,
                      3: om.MEulerRotation.kYXZ,
                      4: om.MEulerRotation.kYZX,
                      5: om.MEulerRotation.kZXY,
                      6: om.MEulerRotation.kZYX}
    epsilon = 0.001

    def lateInit(self, **kwargs):
        super(MirrorAnimModel, self).lateInit(**kwargs)

        meta_nodes = getMetaNodes(mTypes='MsvRigComponentMarkerControl')
        if meta_nodes:
            self.marker_ctl_full_name = '%s:%s' % (meta_nodes[0].nameSpaceFull(), meta_nodes[0].get_virtual_name())
            self.marker_ctl_display_name = meta_nodes[0].get_virtual_name()
            self._sendMessage('mirror_plan', self.marker_ctl_display_name)
        else:
            self.marker_ctl_full_name = None
            self.marker_ctl_display_name = None

    def mirror(self, args):
        mirror_pose = args[0]
        mirror_plan = args[1]

        if mirror_pose == 'l2r':
            sources = [ctl for ctl in mc.ls(sl=True) if 'L_' in ctl]
            dests = [ctl.replace('L_', 'R_') for ctl in sources]
        elif mirror_pose == 'r2l':
            sources = [ctl for ctl in mc.ls(sl=True) if 'R_' in ctl]
            dests = [ctl.replace('R_', 'L_') for ctl in sources]
        else:
            sources = list()
            dests = list()

        self._mirror_poses(sources, dests, mirror_plan)

    @classmethod
    def _mirror_poses(cls, sources, dests, mirror_plan):
        # iterate 10 times to get a stable version
        msg_logs = list()

        for i in range(10):
            for j in range(len(sources)):
                source = sources[j]
                dest = dests[j]
                msg = cls._mirror_pose(source, dest, mirror_plan)
                if msg not in msg_logs:
                    msg_logs.append(msg)

        for msg in msg_logs:
            print msg

    @classmethod
    def _mirror_pose(cls, source, dest, mirror_plan):
        """
        yz as mirror plan
          x  y  z
        |-1  0  0  0 |
        | 0  1  0  0 |
        | 0  0  1  0 |
        | 0  0  0  1 |
        Custom mirror pose
        :param target:
        :return:
        """
        source_fn_node = cls._fn_transform(source)
        source_parent_list = list()
        cls._get_all_parents(source_fn_node.object(), source_parent_list)

        dest_fn_node = cls._fn_transform(dest)
        dest_parent_list = list()
        cls._get_all_parents(dest_fn_node.object(), dest_parent_list)

        # rotate mirror plan
        if mirror_plan and mc.objExists(mirror_plan):
            mirror_fn_node = cls._fn_transform(mirror_plan)
            mirror_parent_list = list()
            cls._get_all_parents(mirror_fn_node.object(), mirror_parent_list)

            mirror_plan = om.MVector(1, 0, 0)
            mirror_world_mat = mirror_fn_node.transformationMatrix() * cls._object_to_world(mirror_parent_list)
            mirror_plan = mirror_plan * mirror_world_mat
        else:
            mirror_plan = om.MVector(1, 0, 0)
            mirror_world_mat = om.MMatrix.kIdentity

        msg = ''
        msg += cls._mirror_translation(source_fn_node,
                                       source_parent_list,
                                       dest_fn_node,
                                       dest_parent_list,
                                       mirror_plan,
                                       mirror_world_mat)

        msg += cls._mirror_rotation(source_fn_node,
                                    source_parent_list,
                                    dest_fn_node,
                                    dest_parent_list,
                                    mirror_plan,
                                    mirror_world_mat)

        return msg

    @classmethod
    def _mirror_translation(cls,
                            source_fn_node,
                            source_parent_list,
                            dest_fn_node,
                            dest_parent_list,
                            mirror_plan,
                            mirror_world_mat):

        # remove rotate component
        mirror_world_mat = (om.MTransformationMatrix(mirror_world_mat).setRotation(om.MQuaternion.kIdentity)).asMatrix()

        mirror_plan_mat = om.MMatrix([1 - 2 * mirror_plan.x * mirror_plan.x,    -2 * mirror_plan.x * mirror_plan.y,    -2 * mirror_plan.x * mirror_plan.z, 0,
                                         -2 * mirror_plan.x * mirror_plan.y, 1 - 2 * mirror_plan.y * mirror_plan.y,    -2 * mirror_plan.y * mirror_plan.z, 0,
                                         -2 * mirror_plan.x * mirror_plan.z,    -2 * mirror_plan.y * mirror_plan.z, 1 - 2 * mirror_plan.z * mirror_plan.z, 0,
                                     0, 0, 0, 1])

        node_matrix = source_fn_node.transformationMatrix() * cls._object_to_world(source_parent_list) * \
                        mirror_world_mat.inverse() * mirror_plan_mat * mirror_world_mat * \
                        cls._world_to_object(dest_parent_list)

        translation = om.MTransformationMatrix(node_matrix).translation(om.MSpace.kTransform)
        dest_fn_node.setTranslation(translation, om.MSpace.kTransform)

        return ''

    @classmethod
    def _mirror_rotation(cls,
                         source_fn_node,
                         source_parent_list,
                         dest_fn_node,
                         dest_parent_list,
                         mirror_plan,
                         mirror_world_mat):
        source_name = source_fn_node.fullPathName()
        dest_name = dest_fn_node.fullPathName()

        # source_bind_pose_rot = om.MEulerRotation(math.radians(mc.getAttr(source_name + '.worldRotateX')),
        #                                          math.radians(mc.getAttr(source_name + '.worldRotateY')),
        #                                          math.radians(mc.getAttr(source_name + '.worldRotateZ')),
        #                                          cls.rotation_order[source_fn_node.rotationOrder()])
        # dest_bind_pose_rot = om.MEulerRotation(math.radians(mc.getAttr(dest_name + '.worldRotateX')),
        #                                        math.radians(mc.getAttr(dest_name + '.worldRotateY')),
        #                                        math.radians(mc.getAttr(dest_name + '.worldRotateZ')),
        #                                        cls.rotation_order[dest_fn_node.rotationOrder()])

        source_bind_pose_rot = om.MEulerRotation(mc.getAttr(source_name + '.shapeCreationBaseRotateRadiansX'),
                                                 mc.getAttr(source_name + '.shapeCreationBaseRotateRadiansY'),
                                                 mc.getAttr(source_name + '.shapeCreationBaseRotateRadiansZ'),
                                                 cls.rotation_order[source_fn_node.rotationOrder()])
        dest_bind_pose_rot = om.MEulerRotation(mc.getAttr(dest_name + '.shapeCreationBaseRotateRadiansX'),
                                               mc.getAttr(dest_name + '.shapeCreationBaseRotateRadiansY'),
                                               mc.getAttr(dest_name + '.shapeCreationBaseRotateRadiansZ'),
                                               cls.rotation_order[dest_fn_node.rotationOrder()])

        source_bind_pose_quat = source_bind_pose_rot.asQuaternion()
        dest_bind_pose_quat = dest_bind_pose_rot.asQuaternion()

        source_axis = source_bind_pose_quat.asAxisAngle()[0]
        dest_axis = dest_bind_pose_quat.asAxisAngle()[0]

        source_rot = source_bind_pose_quat.asAxisAngle()[1]
        dest_rot = dest_bind_pose_quat.asAxisAngle()[1]

        # print source_bind_pose_rot, source_bind_pose_quat, source_bind_pose_rot.x, source_bind_pose_rot.y, source_bind_pose_rot.z
        # print dest_bind_pose_rot, dest_bind_pose_quat, dest_bind_pose_rot.x, dest_bind_pose_rot.y, dest_bind_pose_rot.z
        # print source_bind_pose_quat, source_axis
        # print dest_bind_pose_quat, dest_axis
        # print source_bind_pose_quat.asAxisAngle()
        # print dest_bind_pose_quat.asAxisAngle()
        # print source_rot + dest_rot
        # print source_axis[0] + dest_axis[0]
        # print source_axis[1] + dest_axis[1]
        # print source_axis[2] + dest_axis[2]
        # # if ((-cls.epsilon < source_axis[1] + dest_axis[1] < cls.epsilon) and (-cls.epsilon < source_axis[2] + dest_axis[2] < cls.epsilon)) or \
        # #         (source_axis[0] == dest_axis[0] and source_axis[1] == dest_axis[1] and source_axis[2] == dest_axis[2]):
        # if source_bind_pose_rot.y == -dest_bind_pose_rot.y and source_bind_pose_rot.z == -dest_bind_pose_rot.z:
        #     quat = cls.mirror_type_0(source_fn_node, source_parent_list, dest_parent_list, mirror_world_mat)
        # elif source_bind_pose_rot.y == dest_bind_pose_rot.y and source_bind_pose_rot.z == dest_bind_pose_rot.z:
        #     quat = cls.mirror_type_0(source_fn_node, source_parent_list, dest_parent_list, mirror_world_mat)
        # elif 3.1415 < source_rot + dest_rot < 3.1416:
        #     quat = cls.mirror_type_1(source_fn_node)
        # elif 6.2830 < source_rot + dest_rot < 6.2832:
        #     quat = cls.mirror_type_1(source_fn_node)
        # elif -cls.epsilon < source_rot + dest_rot < cls.epsilon:
        #     quat = cls.mirror_type_1(source_fn_node)
        # else:
        #     msg = '\n\nGet error when copy pose from %s -> %s\n\n' % (source_name, dest_name)
        #     quat = om.MQuaternion.kIdentity
        msg = ''
        dot = source_axis * dest_axis
        if -1 - cls.epsilon <= dot <= -1:
            quat = cls.mirror_type_0(source_fn_node, source_parent_list, dest_parent_list, mirror_world_mat)
        elif -1 < dot < -1 + cls.epsilon:
            quat = cls.mirror_type_1(source_fn_node)
        elif -1 + cls.epsilon <= dot < 1 - cls.epsilon:
            quat = cls.mirror_type_0(source_fn_node, source_parent_list, dest_parent_list, mirror_world_mat)
        elif 1 - cls.epsilon <= dot < 1:
            quat = cls.mirror_type_1(source_fn_node)
        elif 1 <= dot < 1 + cls.epsilon:
            quat = cls.mirror_type_0(source_fn_node, source_parent_list, dest_parent_list, mirror_world_mat)
        else:
            msg = '\n\nGet error when copy pose from %s -> %s\n\n' % (source_name, dest_name)
            quat = cls.mirror_type_1(source_fn_node)

        dest_fn_node.setRotation(quat, om.MSpace.kTransform)

        return msg

    @classmethod
    def mirror_type_0(cls, source_fn_node, source_parent_list, dest_parent_list, mirror_world_mat):
        node_matrix = source_fn_node.transformationMatrix() * cls._object_to_world(source_parent_list)
        quat = om.MTransformationMatrix(node_matrix).rotation(asQuaternion=True)
        mirror_quat = om.MTransformationMatrix(mirror_world_mat).rotation(asQuaternion=True)

        quat = quat * mirror_quat.inverse()

        quat.y *= -1
        quat.z *= -1

        quat = quat * mirror_quat

        node_matrix = om.MTransformationMatrix(node_matrix)
        node_matrix.setRotation(quat)

        node_matrix = node_matrix.asMatrix() * cls._world_to_object(dest_parent_list)

        quat = om.MTransformationMatrix(node_matrix).rotation(asQuaternion=True)
        return quat

    @classmethod
    def mirror_type_1(cls, source_fn_node):
        return source_fn_node.rotation(asQuaternion=True)

    @classmethod
    def _fn_transform(cls, node_name):
        li = om.MGlobal.getSelectionListByName(node_name)
        # for any kWorld function to work,
        # you must have initialised the function set with a dag path instead of an MObject.
        path = li.getDagPath(0)
        return om.MFnTransform(path)

    @classmethod
    def _object_to_world(cls, parent_node_list):
        mat = om.MMatrix()
        for i in range(len(parent_node_list)):
            mat = mat * parent_node_list[i].transformationMatrix()
        return mat

    @classmethod
    def _world_to_object(cls, parent_node_list):
        return cls._object_to_world(parent_node_list).inverse()

    @classmethod
    def _get_all_parents(cls, joint_obj, li):
        if not joint_obj.isNull():
            fn_dag_node = om.MFnDagNode(joint_obj)
            if fn_dag_node.parentCount() > 0:
                parent_obj = fn_dag_node.parent(0)
                parent = om.MFnTransform(parent_obj)
                try:
                    parent.name()
                    li.append(parent)
                    cls._get_all_parents(parent_obj, li)
                except:
                    pass
