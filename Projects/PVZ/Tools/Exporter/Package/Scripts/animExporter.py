#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 5/7/2018
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : animExporter.py


from exporter import Exporter
from maya import cmds as mc
from Core.MayaGUI import dialog
from Projects.PVZ.Tools.BakeKeyframe.Package.Scripts import bakeKeyframeModel
from Common.Functions import commonFunction
from functools import partial
from previewExporter import PreviewExporter
import os
import re


class AnimExporter(Exporter):
    RootJoint = 'DeformationSystem'
    RootMeshGroup = 'mesh'
    BaseDir = 'base'
    BaseIndex = '000'

    def __init__(self, **kwargs):
        super(AnimExporter, self).__init__(**kwargs)
        self.__exportRootPath = 'unity/Assets/_Assets/ABSrc'

    def __validateFile(self):
        if not mc.objExists(self.RootMeshGroup):
            gui = dialog.ConfirmDialog2(**{'message': 'Can\'t find "%s"' % self.RootMeshGroup})
            gui.show()
            return False
        else:
            try:
                mc.select(self.RootMeshGroup)
            except:
                gui = dialog.ConfirmDialog2(**{'message': 'More than one object matches name: %s' % self.RootMeshGroup})
                gui.show()
                return False

        if not mc.objExists(self.RootJoint):
            gui = dialog.ConfirmDialog2(**{'message': 'Can\'t find "%s"' % self.RootJoint})
            gui.show()
            return False
        else:
            try:
                mc.select(self.RootJoint)
            except:
                gui = dialog.ConfirmDialog2(**{'message': 'More than one object matches name: %s' % self.RootJoint})
                gui.show()
                return False

        return True

    def __exportAvatarPart(self, destPath):
        """
        Export avatar part rule:
        every part should be exported separately
        :return:
        """
        shapeNodeList = []
        commonFunction.getAllChildrenByType(self.RootMeshGroup, shapeNodeList, 'mesh')

        for shapeNode in shapeNodeList:
            # parentNode like this: |mesh|zombie_allstar_001|lod0|zombie_allstar_001_head_lod0
            parentNode = '|'.join(shapeNode.split('|')[:-1])

            avatarPartName = parentNode.split('|')[-1]

            avatarPart = avatarPartName.split('_')[3]
            avatarIndex = avatarPartName.split('_')[2]

            exportFBXPath = os.path.join(destPath, avatarIndex, avatarPart)

            if not os.path.exists(exportFBXPath):
                os.makedirs(exportFBXPath)

            self._exportFBX('anim',
                            [self.RootJoint, parentNode],
                            os.path.join(exportFBXPath, avatarPartName + '.fbx'))

            # export texture
            metaDatas = self._exportTextures(parentNode, exportFBXPath)

            # export meta
            self._exportMetaInfo(metaDatas, exportFBXPath, avatarPartName)

    @property
    def _PBRChannelDict(self):
        return {'Albedo': 'a',
                'Specular': 's',
                'Normal': 'n',
                'Emission': 'e',
                'Occlusion': 'ao',
                'Thickness': 'th'}

    def _exportTPose(self, *args):
        assetType = args[0]
        assetName = args[1]

        for path in self._exportPaths:
            # export avatar part
            destPath = os.path.join(path, self.__exportRootPath, assetType, assetName, 'avatar')
            if not os.path.exists(destPath):
                os.makedirs(destPath)
            self.__exportAvatarPart(destPath)

        # export a preview model to debug
        exporter = PreviewExporter(**{'exportPaths': self._exportPaths})
        exporter.exportPreviewModel()

    def _processPBRTextures(self, exportTexturePath, nodeName, material):
        filterString = '_%s_' % self.BaseIndex

        # isBaseTexture = filterString not in nodeName.split('|')[-1] and filterString in material['Albedo']
        isBaseTexture = filterString in material['Albedo']
        if isBaseTexture:
            exportTexturePath = '%s/../../%s' % (exportTexturePath, self.BaseDir)
            if not os.path.exists(exportTexturePath):
                os.makedirs(exportTexturePath)

        super(AnimExporter, self)._processPBRTextures(exportTexturePath, nodeName, material)

        if isBaseTexture:
            # if avatar part use base textures (the name including _000_)
            # then we need to export them into base folder
            for k, v in self._PBRChannelDict.items():
                material[k] = '/../../%s/%s' % (self.BaseDir, os.path.basename(material[k]))

    def _renameMaterial(self, materialName):
        """
        Use this function to deal with reference issues
        :return:
        """
        # if we reuse material and reference it into scene
        # material name will be add a postfix number, remove it
        return re.sub(r'_mat\d+$', '_mat', materialName)

    def exportAnimClip(self):
        if not self.__validateFile():
            return

        assetPath = mc.file(q=True, sn=True).replace('\\', '/')
        tmp = assetPath.split('/')

        # plants or zombies
        assetType = tmp[-4].lower()

        # character name
        assetName = tmp[-3].lower()

        animName = tmp[-1].split('.')[0]
        for path in self._exportPaths:
            destPath = os.path.join(path, self.__exportRootPath, assetType, assetName, 'anim')
            if not os.path.exists(destPath):
                os.makedirs(destPath)

            instance = bakeKeyframeModel.BakeKeyframeModel()

            # bake key frame
            instance.bake(self.RootJoint)

            # export
            exportDest = os.path.join(destPath, animName + '.fbx')
            self._exportFBX('anim',
                            [self.RootJoint, self.RootMeshGroup],
                            exportDest)

            # reconnect the constraint
            instance.reconnect()
            instance.removeKeyframes()

            print '\n\tExport anim clip to %s!\n' % exportDest

    def exportTPose(self):
        if not self.__validateFile():
            return False

        # assetPath: F:/Projects/PVZCommando/ArtDev/art_source/characters/zombies/allstar/animations/zombie_allstar@t.ma
        assetPath = mc.file(q=True, sn=True).replace('\\', '/')
        tmp = assetPath.split('/')

        # plants or zombies
        # F:/Projects/PVZCommando/ArtDev/art_source/characters/${zombies}$/allstar/animations/zombie_allstar@t.ma
        assetType = tmp[-4].lower()

        # character name
        # F:/Projects/PVZCommando/ArtDev/art_source/characters/zombies/${allstar}$/animations/zombie_allstar@t.ma
        assetName = tmp[-3].lower()

        gui = dialog.ConfirmDialog2(**{'message': 'Character Type is: "%s"\nCharacter Name is: "%s"' % (assetType, assetName),
                                       'doConfirm': partial(self._exportTPose, assetType, assetName)})
        gui.show()

