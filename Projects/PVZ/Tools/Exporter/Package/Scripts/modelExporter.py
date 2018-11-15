#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 5/7/2018
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : modelExporter.py


from exporter import Exporter
from maya import cmds as mc
from Core.MayaGUI import dialog
import os


class ModelExporter(Exporter):
    RootMeshGroup = 'mesh'

    def exportStaticModel(self):
        self.__exportModel(r'unity\Assets\ArtSrc\TestModels', False)

    def exportProp(self):
        self.__exportModel(r'unity\Assets\ArtSrc\Models\Environments', False)

    def exportAnimedProp(self):
        self.__exportModel(r'unity\Assets\ArtSrc\Models\DynamicEnvironments', True)

    @property
    def _PBRChannelDict(self):
        return {'Albedo': 'd',
                'Specular': 's',
                'Normal': 'n',
                'Emission': 'e'}

    def __exportModel(self, unityPath, skinnedModel):

        if not mc.objExists(self.RootMeshGroup):
            gui = dialog.ConfirmDialog2(**{'message': 'Can\'t find "%s"' % self.RootMeshGroup})
            gui.show()
            return

        assetPath = mc.file(q=True, sn=True).replace('\\', '/')
        tmp = assetPath.split('/')
        assetType = tmp[-2].lower()
        assetName = tmp[-1].lower().split('.')[0]

        for path in self._exportPaths:
            destPath = os.path.join(path, unityPath, assetType)

            if not os.path.exists(destPath):
                os.makedirs(destPath)

            # export fbx
            self._exportFBX('anim' if skinnedModel else 'model',
                            [self.RootMeshGroup],
                            os.path.join(destPath, assetName + '.fbx'))

            # export texture
            metaDatas = self._exportTextures(self.RootMeshGroup, destPath)

            self._exportMetaInfo(metaDatas, destPath, assetName)




