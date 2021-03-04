#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 3/14/2019
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : animationScriptsAndFiles.py


# This scripts source code came from here:
# https://area.autodesk.com/downloads/motionbuilder-animation-scripts/#comments


import sys

if 'motionbuilder' in sys.executable:
    from pyfbsdk import *
else:
    from pyfbsdk_gen_doc import *


def createTakes():
    system = FBSystem()
    for i in range(2, 10):
        take = FBTake('Take 00%s' % i)
        system.Scene.Takes.append(take)


def setCurrentTake():
    system = FBSystem()

    print system.CurrentTake.Name
    system.CurrentTake = system.Scene.Takes[5]
    print system.CurrentTake.Name


def createAnimatedCube():
    animatedCube = FBModelCube('animatedCube')
    animatedCube.Show = True

    # create a new layer
    system = FBSystem()

    for i in range(5):
        system.CurrentTake.CreateNewLayer()

    count = system.CurrentTake.GetLayerCount()
    for i in range(1, count):
        layer = system.CurrentTake.GetLayer(i)
        layer.Name = 'Python Anim Layer %s' % i
        layer.Weight = i * 15
        layer.LayerMode = FBLayerMode.kFBLayerModeAdditive if i % 2 == 0 else FBLayerMode.kFBLayerModeOverride


def run():
    FBApplication().FileNew()
    # createTakes()
    # setCurrentTake()
    createAnimatedCube()
