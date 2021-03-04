#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/03/30
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : keyframeData.py

from maya.api import OpenMaya as om


class KeyframeData(object):
    keyframe = 0
    delay = 0
    amplitude = 0
    cycle = 1
    damping = 0
    disturbance = om.MVector.kZeroVector
    gravity = om.MVector(0, -9.8, 0)

    follow = False
    follow_object = None
    follow_delay = 0
    follow_amp = 1

    rx = False
    ry = False
    rz = False
    tx = False
    ty = False
    tz = False

    def __init__(self, keyframe_data):
        # if isinstance(keyframe_data, KeyframeData): # do not why there is always false
        if keyframe_data.__class__.__name__ == 'KeyframeData':
            self._keyframe_data = keyframe_data
            self._copy()
        elif isinstance(keyframe_data, (str, unicode)):
            self._keyframe_data_str = keyframe_data
            self._parse()
        elif isinstance(keyframe_data, dict):
            for k, v in keyframe_data.items():
                setattr(self, k, v)

    @property
    def to_string(self):
        long_str = '%s;%s;%s;%s;%s;%s,%s,%s;%s,%s,%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s' % (
            self.keyframe,
            self.delay,
            self.amplitude,
            self.cycle,
            self.damping,
            self.disturbance.x, self.disturbance.y, self.disturbance.z,
            self.gravity.x, self.gravity.y, self.gravity.z,
            self.follow,
            self.follow_object,
            self.follow_delay,
            self.follow_amp,
            self.rx,
            self.ry,
            self.rz,
            self.tx,
            self.ty,
            self.tz)

        return long_str

    def _copy(self):
        self.keyframe = self._keyframe_data.keyframe
        self.delay = self._keyframe_data.delay
        self.amplitude = self._keyframe_data.amplitude
        self.cycle = self._keyframe_data.cycle
        self.damping = self._keyframe_data.damping
        self.disturbance = self._keyframe_data.disturbance
        self.gravity = self._keyframe_data.gravity

        self.follow = self._keyframe_data.follow
        self.follow_object = self._keyframe_data.follow_object
        self.follow_delay = self._keyframe_data.follow_delay
        self.follow_amp = self._keyframe_data.follow_amp

        self.rx = self._keyframe_data.rx
        self.ry = self._keyframe_data.ry
        self.rz = self._keyframe_data.rz

        self.tx = self._keyframe_data.tx
        self.ty = self._keyframe_data.ty
        self.tz = self._keyframe_data.tz

    def _parse(self):
        arr = self._keyframe_data_str.split(';')
        self.keyframe = float(arr[0])
        self.delay = float(arr[1])
        self.amplitude = float(arr[2])
        self.cycle = float(arr[3])
        self.damping = float(arr[4])

        disturbance_arr = arr[5].split(',')
        self.disturbance = om.MVector(float(disturbance_arr[0]),
                                      float(disturbance_arr[1]),
                                      float(disturbance_arr[2]))

        gravity_arr = arr[6].split(',')
        self.gravity = om.MVector(float(gravity_arr[0]),
                                  float(gravity_arr[1]),
                                  float(gravity_arr[2]))

        self.follow = bool(arr[7] == 'True')
        self.follow_object = arr[8]
        self.follow_delay = float(arr[9])
        self.follow_amp = float(arr[10])

        self.rx = bool(arr[11] == 'True')
        self.ry = bool(arr[12] == 'True')
        self.rz = bool(arr[13] == 'True')
        self.tx = bool(arr[14] == 'True')
        self.ty = bool(arr[15] == 'True')
        self.tz = bool(arr[16] == 'True')
