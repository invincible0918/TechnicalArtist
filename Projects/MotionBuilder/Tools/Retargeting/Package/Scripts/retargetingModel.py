#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/03/15
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : retargetingModel.py

import os
import sys
from Core.MotionBuilderGUI.LitFrame.model import Model
from functools import partial


if 'motionbuilder' in sys.executable:
    from pyfbsdk import *
else:
    from pyfbsdk_gen_doc import *


class RetargetingModel(Model):
    def lateInit(self, **kwargs):
        super(RetargetingModel, self).lateInit(**kwargs)

        self.__mocapFile = r'F:\Projects\PVZCommando\ArtDev\TA\Projects\MotionBuilder\Tools\Retargeting\Package\Assets\HERO_RUN_FAST_Copy2.fbx'
        self.__mocapRoot = 'Model::Humanoid:MaxToFilmbox_Root'

        self.__modelFile = r'F:\Projects\PVZCommando\ArtDev\TA\Projects\MotionBuilder\Tools\Retargeting\Package\Assets\mia_blue.fbx'
        self.__modelRoot = 'Model::Mia:Root'

        self.__splitChar = ':'

        self.doIt()

    def __jointGroup(self, root, jointDict):
        for child in root.Children:
            fullName = child.FullName

            jointDict[fullName] = child
            self.__jointGroup(child, jointDict)

    def __setupRig(self, rootName, character):
        jointDict = dict()

        root = FBFindObjectByFullName(rootName)
        self.__jointGroup(root, jointDict)

        # match joint slot
        for k, v in jointDict.items():
            jointName = k.split(self.__splitChar)[-1]
            slot = character.PropertyList.Find('%sLink' % jointName)
            if slot != None:
                slot.append(v)

        FBPlayerControl().Goto(FBTime(0, 0, 0, 0))
        FBSystem().Scene.Evaluate()

    def __modifyTPose(self, jointDict):
        for k, v in jointDict.items():
            if k.endswith('LeftShoulder'):
                # v.Rotation = FBVector3d(-7.2, -2.19, -91.98)
                v.Rotation = FBVector3d(0, 0, 10.33)
            elif k.endswith('RightShoulder'):
                # v.Rotation = FBVector3d(172.81, 2.19, 93.92)
                v.Rotation = FBVector3d(0, 0, 8.39)

    def __importMocapData(self):
        FBApplication().FileOpen(self.__mocapFile)

        # create a character named "testCharacter"
        character = FBCharacter('mocapCharacter')
        FBApplication().CurrentCharacter = character

        self.__setupRig(self.__mocapRoot, character)

        FBPlayerControl().Goto(FBTime(0, 0, 0, 0))
        FBSystem().Scene.Evaluate()

        character.SetCharacterizeOn(True)

        return character

    def __importModel(self):
        FBApplication().FileMerge(self.__modelFile)

        # create a character named "testCharacter"
        character = FBCharacter('modelCharacter')
        FBApplication().CurrentCharacter = character

        self.__setupRig(self.__modelRoot, character)

        character.SetCharacterizeOn(True)

        return character

    def __retargeting(self):
        FBApplication().FileNew()

        source = self.__importMocapData()
        character = self.__importModel()

        # Drive the character by mocap animation data
        character.InputCharacter = source
        character.InputType = FBCharacterInputType.kFBCharacterInputCharacter
        character.Active = True

        return character, source

    def __createPlotOptions(self):
        plotOptions = FBPlotOptions()
        plotOptions.ConstantKeyReducerKeepOneKey = True
        plotOptions.PlotAllTakes = False
        plotOptions.PlotOnFrame = True
        plotOptions.PlotPeriod = FBTime(0, 0, 0, 1)
        plotOptions.PlotTranslationOnrootOnly = True
        plotOptions.PreciseTimeDiscontinuities = True
        plotOptions.RotationFilterToApply = FBRotationFilter.kFBRotationFilterUnroll
        plotOptions.UseConstantKeyReducer = True

        return plotOptions

    def __bake2Skeleton(self, character):
        plotOptions = self.__createPlotOptions()
        character.PlotAnimation(FBCharacterPlotWhere.kFBCharacterPlotOnSkeleton, plotOptions)

    def __bake2ControlRig(self, character):
        # Create a control rig using FK/IK as specified by the 'True' parameter
        character.CreateControlRig(True)

        li = FBComponentList()
        FBFindObjectsByName('*Control Rig*', li, False, False)

        currentCharacterName = FBApplication().CurrentCharacter.Name
        currentControlRig = None
        for obj in li:
            if isinstance(obj, FBControlSet):
                if '%s_Ctrl' % currentCharacterName in obj.GetReferenceModel().FullName:
                    currentControlRig = obj

        character.ConnectControlRig(currentControlRig, True, True)

        plotOptions = self.__createPlotOptions()
        character.PlotAnimation(FBCharacterPlotWhere.kFBCharacterPlotOnControlRig, plotOptions)

    def __removeCharacter(self, character):
        FBDeleteObjectsByName(character.LongName)

    def __getChildren(self, parent, li):
        li.append(parent)
        for child in parent.Children:
            self.__getChildren(child, li)

    def __deleteBranches(self, rootFullName):
        mocapRoot = FBFindObjectByFullName(rootFullName)
        li = list()
        self.__getChildren(mocapRoot, li)

        for i in reversed(range(len(li))):
            li[i].FBDelete()

    def doIt(self):
        # Retarget the animation clip to model
        character, source = self.__retargeting()

        # Bake animation data to skeleton
        self.__bake2Skeleton(character)

        # Delete mocap character
        self.__removeCharacter(source)

        # Delete mocap model branches
        self.__deleteBranches(self.__mocapRoot)

        newFilePath = r'F:\Projects\PVZCommando\ArtDev\TA\Projects\MotionBuilder\Tools\Retargeting\Package\Assets\result.fbx'

        fbxOptions = FBFbxOptions(False, None)
        FBApplication().FileSave(newFilePath, fbxOptions)

