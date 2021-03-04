#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 3/13/2019
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : jointChains.py


import sys

if 'motionbuilder' in sys.executable:
    from pyfbsdk import *
else:
    from pyfbsdk_gen_doc import *


from Projects.MotionBuilder.Tools.MBOutput import output


def createModel(index, translation):
    model = FBCreateObject('Browsing/Templates/Elements/Primitives', 'Cube', 'Cube')
    model.Name = 'testModel_%s' % index
    model.Translation = translation
    model.Scaling = FBVector3d(1, 1, 1)
    model.Show = True

    return model


def createNull(index, translation):
    """
    Create a null model at the specific position
    A null model is used to identify the rotation point between 2 models to form a joint
    :param index:
    :param translation:
    :return:
    """
    nullModel = FBModelNull('testNull_%s' % index)
    nullModel.Translation = translation
    nullModel.Show = True

    return nullModel


def createModelChain(chainStart, numOfModels, modelSpacing):
    models = []
    for i in range(numOfModels):
        modelOffset = modelSpacing * i
        modelPosition = chainStart + modelOffset
        newModel = createModel(i, modelPosition)
        models.append(newModel)

    return models


def createNullsFromModels(models):
    """
    :param models:
    :return: nullDict = {
    (testModel_0, testModel_1): testNull_0,
    (testModel_1, testModel_2): testNull_1,
    (testModel_2, testModel_3): testNull_2
    }
    """
    nullDict = dict()
    for i in range(len(models)-1):
        parent = models[i]
        child = models[i+1]

        position0 = parent.Translation.Data
        position1 = child.Translation.Data

        nullPosition = (position0 + position1) / 2

        nullModel = createNull(i, nullPosition)
        nullDict[(parent, child)] = nullModel

    return nullDict


def applyRigidBody(modelList, activation):
    rigidBody = FBCreateObject('Browsing/Templates/Physical Properties', 'Rigid Body', 'Rigid Body')

    activationProp = rigidBody.PropertyList.Find('Activation')
    activationProp.Data = activation

    if activation == 0:
        correctMassCenter = rigidBody.PropertyList.Find('Correct Mass Center')
        correctMassCenter.Data = False

    for model in modelList:
        FBConnect(rigidBody, model)


def createJoints(nullDict):
    joint = FBCreateObject('Browsing/Templates/Physical Properties', 'Joint', 'Joint')

    for (parent, child), nullModel in nullDict.iteritems():
        FBConnect(joint, nullModel)

        for component in joint.Components:
            if component.Name == nullModel.Name + ' Joint':
                connectionProp = component.PropertyList.Find('Connections')
                if connectionProp != None:
                    FBConnect(parent, connectionProp)
                    FBConnect(child, connectionProp)


def createPhysicsSolver(gravity):
    solver = FBCreateObject('Browsing/Templates/Solvers', 'Physics Solver', 'Physics Solver')

    # Set the gravity property.
    solver.PropertyList.Find('Gravity').Data = gravity

    # Activate the Physics solver.
    solver.Active = True
    solver.Live = True


def run():
    FBApplication().FileNew()

    numModels = 7
    modelSpacing = FBVector3d(0, 21, 0)
    chainStart = FBVector3d(-50, 0, 0)
    gravity = FBVector3d(0, -9.81, 0)

    # Create a chain of models.
    models = createModelChain(chainStart, numModels, modelSpacing)
    applyRigidBody([models[0]], 2)  # Rigid Body - Passive Activation (2).
    applyRigidBody(models[1:], 0)  # Rigid Body - Active Activation (0).

    # Create nulls between each model.
    nullDict = createNullsFromModels(models)

    # Create the joints between the models and the nulls.
    createJoints(nullDict)

    # Create and activate a physics solver in the scene.
    createPhysicsSolver(gravity)

    # Move the base to make the chain wiggle.
    models[0].Translation.Data += FBVector3d(50, 0, 0)
