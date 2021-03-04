#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 6/18/2019 11:52 AM
# @Author  : invincible0918@126.com
# @Site    : 
# @File    : customMayaEvent.py
# @Software: PyCharm


from maya.api import OpenMaya as om


def SceneOpened(function, runOnce):
    print """
    ##############################################
    ###########  Scene Opened Event ##############
    ##############################################
    """
    callback = om.MEventMessage.addEventCallback("SceneOpened", function)

    if runOnce:
        om.MMessage.removeCallback(callback)
