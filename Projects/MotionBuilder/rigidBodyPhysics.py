#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 3/12/2019
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : rigidBodyPhysics.py


import sys

if 'motionbuilder' in sys.executable:
    from pyfbsdk import *
else:
    from pyfbsdk_gen_doc import *

from Projects.MotionBuilder.Tools.MBOutput import output
import modelReference
reload(modelReference)


# Reference Help Doc: http://help.autodesk.com/view/MOBPRO/2018/ENU/?guid=__files_GUID_FFBAE6DD_7929_4421_B7F3_4AEE50A2F0EB_htm


def createModel(translation, scalingCoefficient):
    model = FBCreateObject('Browsing/Templates/Elements/Primitives', 'Cube', 'Cube')
    model.Name = 'testCube'
    model.Translation = translation
    model.Scaling = FBVector3d(scalingCoefficient, scalingCoefficient, scalingCoefficient)
    model.Show = True

    return model


def createGrid(center, modelsPerSide):
    gridModels = []
    spacing = 20

    halfSide = (int)(modelsPerSide / 2)
    for i in range(-halfSide, halfSide):
        for j in range(-halfSide, halfSide):
            xOffset = center[0] + i * spacing
            yOffset = center[1]
            zOffset = center[2] + j * spacing

            model = createModel(FBVector3d(xOffset, yOffset, zOffset), 0.65)
            gridModels.append(model)

    return gridModels


def applyRigidBody(modelList, activation):
    """
    Apply a rigid body physical property to the models
    The activation parameter defines the Activation value
    :param modelList:
    :param activation: 0: Active; 1: Active at collision; 2: Passive
    :return:
    """

    rigidBody = FBCreateObject('Browsing/Templates/Physical Properties', 'Rigid Body', 'Rigid Body')

    # Set the Activation property
    activationProp = rigidBody.PropertyList.Find('Activation')
    activationProp.Data = activation

    # If we're using Active activation, set the correct Mass Center to false
    if (activation == 0):
        correctMassCenter = rigidBody.PropertyList.Find('Correct Mass Center')
        correctMassCenter.Data = False

    # Connect the rigid body to the model
    for model in modelList:
        FBConnect(rigidBody, model)


def createPhysicsSolver():
    solver = FBCreateObject('Browsing/Templates/Solvers', 'Physics Solver', 'Physics Solver')

    # Set the gravity to accelerate upwards
    solver.PropertyList.Find('Gravity').Data = FBVector3d(0, -9.81, 0)

    # Active the Physics solver
    solver.Active = True
    solver.Live = True


def run():
    FBApplication().FileNew()

    model = createModel(FBVector3d(0, 200, 20), 1.5)
    applyRigidBody([model], 0)

    gridModels = createGrid(FBVector3d(0, 75, 0), 8)
    applyRigidBody(gridModels, 1)

    createPhysicsSolver()
