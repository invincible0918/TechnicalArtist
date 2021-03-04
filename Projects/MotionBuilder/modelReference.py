#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 3/5/2019
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : test001.py


import sys

if 'motionbuilder' in sys.executable:
    from pyfbsdk import *
else:
    from pyfbsdk_gen_doc import *

from Projects.MotionBuilder.Tools.MBOutput import output


JointMap = {
    # jointName,     (parentName,       translation  )
    'Reference': (None, (0, 0, 0)),
    'Hips': ('Reference', (0, 75, 0)),
    'LeftUpLeg': ('Hips', (15, -10, 0)),
    'LeftLeg': ('LeftUpLeg', (0, -30, 0)),
    'LeftFoot': ('LeftLeg', (0, -30, 0)),
    'RightUpLeg': ('Hips', (-15, -10, 0)),
    'RightLeg': ('RightUpLeg', (0, -30, 0)),
    'RightFoot': ('RightLeg', (0, -30, 0)),
    'Spine': ('Hips', (0, 40, 0)),
    'LeftArm': ('Spine', (20, 10, 0)),
    'LeftForeArm': ('LeftArm', (30, 0, 0)),
    'LeftHand': ('LeftForeArm', (30, 0, 0)),
    'RightArm': ('Spine', (-20, 10, 0)),
    'RightForeArm': ('RightArm', (-30, 0, 0)),
    'RightHand': ('RightForeArm', (-30, 0, 0)),
    'Head': ('Spine', (0, 30, 0)),
}


def createSkeleton(nameSpace, color):
    skeletonDict = {}

    for jointName, (parentName, translation) in JointMap.iteritems():
        if jointName in ('Reference', 'Hips'):
            joint = FBModelRoot(jointName)
        else:
            joint = FBModelSkeleton(jointName)

        joint.LongName = '%s:%s' % (nameSpace, jointName)
        joint.Color = color
        joint.Size = 250
        joint.Show = True

        skeletonDict[jointName] = joint

    for jointName, (parentName, translation) in JointMap.iteritems():
        if parentName and parentName in JointMap.keys():
            skeletonDict[jointName].Parent = skeletonDict[parentName]
        skeletonDict[jointName].Translation = FBVector3d(translation)

    return skeletonDict


def characterizeSkeleton(characterName, skeletonDict):
    character = FBCharacter(characterName)
    FBApplication().CurrentCharacter = character

    for jointName, joint in skeletonDict.iteritems():
        slot = character.PropertyList.Find('%sLink' % jointName)
        slot.append(joint)

    # Flag that the character has been characterized
    character.SetCharacterizeOn(True)

    # Create a control rig using FK/IK as specified by the 'True' parameter
    character.CreateControlRig(True)

    # Set the control rig to active
    character.ActiveInput = True

    return character


def createModel():
    """
    Create a model which will be applied to each join in the skeleton
    :return:
    """
    model = FBCreateObject('Browsing/Templates/Elements/Primitives', 'Sphere', 'Sphere')
    model.Scaling = FBVector3d(1, 1, 1)

    mat = FBMaterial('testMat')
    mat.Ambient = FBColor(0.5, 0.5, 0.5)
    mat.Diffuse = FBColor(0.8, 0.8, 0.8)
    mat.Specular = FBColor(0, 0.7, 0.7)
    mat.Shininess = 100

    # Create a cartoon like shader
    shader = FBCreateObject('Browsing/Templates/Shading Elements/Shaders', 'Edge Cartoon', 'TestShader')

    # Set shader's parameters
    shader.PropertyList.Find('Antialiasing').Data = True
    shader.PropertyList.Find('EdgeColor').Data = FBColor(0, 0.83, 1)
    shader.PropertyList.Find('EdgeWidth').Data = 10

    # Assign this shader to this model
    model.Shaders.append(shader)

    # The default shader must also be applied to the model
    defaultShader = FBSystem().Scene.Shaders[0]
    model.Shaders.append(defaultShader)

    # Assign this material to this model
    model.Materials.append(mat)

    # Use the default shading mode
    model.ShadingMode = FBModelShadingMode.kFBModelShadingDefault

    return model


def applyModelToSkeleton(skeletonDict, model):
    for jointName, joint in skeletonDict.iteritems():
        if jointName == 'Reference':
            continue

        # Parent the copied model to the joint
        modelClone = model.Clone()
        modelClone.Parent = joint
        modelClone.Show = True

        # Use the joint name as a prefix
        modelClone.Name = '%s_%s' % (jointName, model.Name)

        modelClone.Translation = FBVector3d(0, 0, 0)


def createPoses(character):
    poseList = []

    # Create 1st pose
    pose1 = FBCharacterPose('myPose1')
    pose1.CopyPose(character)
    poseList.append(pose1)

    hipsEffector = character.GetEffectorModel(FBEffectorId.kFBHipsEffectorId)

    # Create 2nd pose
    hipsEffector.Translation = FBVector3d(-100, 50, 0)

    # Note: It's very important to invoke FBSystem().Scene.Evaluate()
    FBSystem().Scene.Evaluate()

    pose2 = FBCharacterPose('myPose2')
    pose2.CopyPose(character)
    poseList.append(pose2)

    # Repeat pose1
    poseList.append(pose1)

    return poseList


def createKeys(character, poseList):
    poseOptions = FBCharacterPoseOptions()
    # for d in dir(poseOptions):
    #     output.log(str(d))

    poseOptions.mCharacterPoseKeyingMode = FBCharacterPoseKeyingMode.kFBCharacterPoseKeyingModeFullBody
    poseOptions.SetFlag(FBCharacterPoseFlag.kFBCharacterPoseMirror, True)

    character.SelectModels(True, False, True, False)

    player = FBPlayerControl()
    frameInterval = 15
    lastFrame = 0

    for i in range(len(poseList)):
        pose = poseList[i]

        # Go to the next frame
        lastFrame = frameInterval * i

        player.Goto(FBTime(0, 0, 0, lastFrame))
        FBSystem().Scene.Evaluate()

        # Apply the pose to the character using our pose options
        pose.PastePose(character, poseOptions)
        FBSystem().Scene.Evaluate()

        # Create a key in the player
        player.Key()
        FBSystem().Scene.Evaluate()

    character.SelectModels(False, False, True, False)
    return lastFrame


def playAnimation(lastFrame):
    player = FBPlayerControl()
    player.LoopStart = FBTime(0, 0, 0, 0)
    player.LoopStop = FBTime(0, 0, 0, lastFrame)
    player.LoopActive = True
    player.GotoStart()
    player.Play()


def run():
    FBApplication().FileNew()
    model = createModel()

    red = FBColor(1, 0, 0)
    skeleton1 = createSkeleton('mySkeleton1', red)
    skeleton1['Reference'].Translation = FBVector3d(-100, 0, 0)

    blue = FBColor(0, 0, 1)
    skeleton2 = createSkeleton('mySkeleton2', blue)
    skeleton2['Reference'].Translation = FBVector3d(100, 0, 0)

    character = characterizeSkeleton('testCharacter', skeleton1)

    applyModelToSkeleton(skeleton1, model)

    poseList = createPoses(character)

    lastFrame = createKeys(character, poseList)
    playAnimation(lastFrame)
