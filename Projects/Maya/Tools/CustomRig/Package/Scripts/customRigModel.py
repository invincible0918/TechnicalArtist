#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/25
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : customRigModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial
from maya import cmds as mc


class CustomRigModel(Model):
    def lateInit(self, **kwargs):
        super(CustomRigModel, self).lateInit(**kwargs)

    def expose_ankle_attribute(self):
        driven_ctl = mc.ls(sl=True)
        if not driven_ctl:
            return

        driven_ctl = driven_ctl[0]
        driver_ctl = self._import_ctl(driven_ctl)
        side, seg = self._move_ctl(driver_ctl)

        if seg != 'B':
            self._set_expression(driven_ctl, driver_ctl, {'flexLimb': 'rotateX',
                                                          'shiftLimb': 'rotateZ'})

        self._lock_and_hide(driver_ctl, ['tx', 'ty', 'tz', 'ry', 'sx', 'sy', 'sz', 'v'])

    def expose_foot_attribute(self):
        driven_ctl = mc.ls(sl=True)
        if not driven_ctl:
            return

        driven_ctl = driven_ctl[0]
        driver_ctl = self._import_ctl(driven_ctl, 'cube_Ctl')
        self._move_ctl(driver_ctl)
        self._set_expression(driven_ctl, driver_ctl, {'bend2ndSegment': 'rotateX',
                                                      'shift2ndSegment': 'rotateZ'})
        self._lock_and_hide(driver_ctl, ['tx', 'ty', 'tz', 'ry', 'sx', 'sy', 'sz', 'v'])

    def link_rotator_ctl(self, state):
        """
        :param state: True: link to ankle, False: link to foot
        :return:
        """
        pass

    def display_femur_limitation(self):
        ctl = mc.ls(sl=True)
        if not ctl:
            return

        ctl = ctl[0]

        side, seg = self._side_and_seg(ctl)
        upper_leg_joint = '%s_%s_upperLeg' % (side, seg)
        if mc.objExists(upper_leg_joint):
            # create ctl
            cross_ctl = self._import_ctl(ctl, 'cross_Ctl')
            if side == 'L':
                mc.xform(cross_ctl, t=[1, 0, 0], os=True)
            else:
                mc.xform(cross_ctl, t=[-1, 0, 0], os=True)

            # display red color
            mc.setAttr(cross_ctl+'.overrideEnabled', True)
            mc.setAttr(cross_ctl+'.overrideColor', 13)  # index 13: red

            # calculation
            mc.addAttr(ctl, ln='threshold', dv=0.95)
            mc.setAttr(ctl+'.threshold', channelBox=True)

            euler_to_quat_node = mc.createNode('eulerToQuat')
            mc.connectAttr(upper_leg_joint+'.rotate', euler_to_quat_node+'.inputRotate')
            mc.connectAttr(upper_leg_joint+'.rotateOrder', euler_to_quat_node+'.inputRotateOrder')

            condition_node = mc.createNode('condition')
            mc.connectAttr(ctl+'.threshold', condition_node+'.firstTerm')
            mc.connectAttr(euler_to_quat_node+'.outputQuatW', condition_node+'.secondTerm')
            mc.setAttr(condition_node+'.operation', 5)  # 5: Less or Equal
            mc.connectAttr(condition_node+'.outColorR', cross_ctl+'.v')

            self._lock_and_hide(cross_ctl, ['tx', 'ty', 'tz', 'rx', 'ry', 'rz', 'sx', 'sy', 'sz', 'v'])
        else:
            self._sendMessage('log', 'Can not find joint: "%s"!' % upper_leg_joint)

    @classmethod
    def _import_ctl(cls, ctl, name):
        ctl_fbx_path = os.path.join(os.path.split(__file__)[0], r'..\Cons\%s.fbx' % name)
        mc.file(ctl_fbx_path, i=True)

        tmp = ctl.split('_')
        new_ctl = '_'.join(tmp[:-1]) + 'Aux_' + tmp[-1]
        mc.rename(name, new_ctl)
        mc.parent(new_ctl, ctl)
        mc.xform(new_ctl, t=[0, 0, 0], os=True)

        return new_ctl

    def _move_ctl(self, ctl):
        side, seg = self._side_and_seg(ctl)

        toe_joint = '%s_%s_toe' % (side, seg)
        if mc.objExists(toe_joint):
            pos = mc.xform(toe_joint, q=True, t=True, ws=True)
            mc.move(pos[0], pos[1], pos[2], [ctl + '.scalePivot', ctl + '.rotatePivot'], rotatePivotRelative=True)
        else:
            self._sendMessage('log', 'Can not find joint: "%s"!' % toe_joint)

        return side, seg

    @classmethod
    def _side_and_seg(cls, ctl):
        tmp = ctl.split('_')
        side = tmp[0]
        seg = tmp[1]
        return side, seg

    @classmethod
    def _lock_and_hide(cls, ctl, lock_and_hide_attrs):
        for attr in lock_and_hide_attrs:
            mc.setAttr(ctl + '.' + attr, lock=True, keyable=False, channelBox=False)

    @classmethod
    def _set_expression(cls, driven_ctl, driver_ctl, attr_dict):
        expression = ''
        for k, v in attr_dict.iteritems():
            if mc.getAttr('%s.%s' % (driven_ctl, k), lock=True):
                mc.setAttr('%s.%s' % (driven_ctl, k), lock=False, keyable=True, channelBox=True)
            expression += '%s.%s = %s.%s;' % (driven_ctl, k, driver_ctl, v)
        mc.expression(s=expression)





