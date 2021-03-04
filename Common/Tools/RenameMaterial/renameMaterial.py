#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/4/7
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : renameMaterial.py


from maya import cmds as mc


class RenameMaterial(object):
    DefaultMaterials = ['particleCloud1', 'lambert1', 'shaderGlow1']

    def __init__(self):
        pass

    def do(self):
        for mat in mc.ls(mat=True):
            if mat in self.DefaultMaterials:
                continue

            shadingEngine = mc.listConnections(mat, source=False, destination=True)[0]
            mc.rename(shadingEngine, mat + '_sg')

            textureFile = mc.listConnections(mat, source=True, destination=False)
            if textureFile:
                textureFile = textureFile[0]
                place2dTexture = mc.listConnections(textureFile, source=True, destination=False)[0]

                mc.rename(textureFile, mat+'_texture')
                mc.rename(place2dTexture, mat + '_place2d')
