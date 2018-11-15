#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 7/23/2018
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : previewExporter.py


from exporter import Exporter
from maya import cmds as mc
from Core.MayaGUI import dialog
import os
import re


class PreviewExporter(Exporter):
    RootJoint = 'DeformationSystem'
    RootMeshGroup = 'mesh'
    BaseIndex = '000'

    def __init__(self, **kwargs):
        super(PreviewExporter, self).__init__(**kwargs)
        self.__exportCharacterPreviewPath = 'unity/Assets/ArtSrc/Models/CharacterPreview'

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
        characterName = args[2]

        for path in self._exportPaths:
            # export whole avatar for preview
            previewDestPath = os.path.join(path, self.__exportCharacterPreviewPath, assetType, assetName + '_preview')
            if not os.path.exists(previewDestPath):
                os.makedirs(previewDestPath)

            if mc.objExists(self.RootJoint) and mc.objExists(self.RootMeshGroup):
                fbxPreset = 'anim'
                fbxNodes = [self.RootJoint, self.RootMeshGroup]

            else:
                fbxPreset = 'model'
                rootNode = os.path.basename(mc.file(q=True, sn=True)).split('.')[0]
                if not mc.objExists(rootNode):
                    gui = dialog.ConfirmDialog2(
                        **{'message': 'Can not find "%s"' % rootNode})
                    gui.show()
                else:
                    self.RootMeshGroup = rootNode
                fbxNodes = [self.RootMeshGroup]

            if fbxPreset and fbxNodes:
                self._exportFBX(fbxPreset,
                                fbxNodes,
                                os.path.join(previewDestPath, characterName + '.fbx'))

                # export texture
                metaDatas = self._exportTextures(self.RootMeshGroup, previewDestPath)

                self._exportMetaInfo(metaDatas, previewDestPath, characterName)

    def _renameMaterial(self, materialName):
        """
        Use this function to deal with reference issues
        :return:
        """
        # if we reuse material and reference it into scene
        # material name will be add a postfix number, remove it
        return re.sub(r'_mat\d+$', '_mat', materialName)

    def exportPreviewModel(self):
        # assetPath: F:/Projects/PVZCommando/ArtDev/art_source/characters/zombies/allstar/animations/zombie_allstar@t.ma
        assetPath = mc.file(q=True, sn=True).replace('\\', '/')
        tmp = assetPath.split('/')

        # plants or zombies
        # F:/Projects/PVZCommando/ArtDev/art_source/characters/${zombies}$/allstar/animations/zombie_allstar@t.ma
        assetType = tmp[-4].lower()

        # asset name
        # F:/Projects/PVZCommando/ArtDev/art_source/characters/zombies/${allstar}$/animations/zombie_allstar@t.ma
        assetName = tmp[-3].lower()

        # character name
        # F:/Projects/PVZCommando/ArtDev/art_source/characters/zombies/${allstar}$/animations/zombie_allstar@t.ma
        characterName = tmp[-1].lower().split('.')[0].split('@')[0]

        self._exportTPose(assetType, assetName, characterName)




