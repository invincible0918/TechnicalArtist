#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 5/7/2018
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : exporter.py


from abc import ABCMeta, abstractmethod, abstractproperty
from maya import mel as mm
from maya import cmds as mc
from Common.Functions import commonFunction
from Core.IO.JSON import jsonIO
from Core.FBX.fbxWrapper import FBXWrapper
import hashlib
import os
import stat


class Exporter(object):
    __metaclass__ = ABCMeta

    def __init__(self, **kwargs):
        self._kwargs = kwargs
        self._exportPaths = self._kwargs['exportPaths']

    def _getHash(self, file):
        f = open(file, 'rb')
        line = f.readline()
        hash = hashlib.md5()

        while line:
            hash.update(line)
            line = f.readline()
        f.close()
        return hash.hexdigest()

    def _isHashEqual(self, f1, f2):
        if not os.path.exists(f1):
            return False

        if not os.path.exists(f2):
            return False

        str1 = self._getHash(f1)
        str2 = self._getHash(f2)
        return str1 == str2

    @abstractproperty
    def _PBRChannelDict(self):
        # key is channel name, value is texture short name
        return {}

    def __exportTexture(self, destPath, source):
        if source:
            dest = os.path.join(destPath, os.path.basename(source)).lower()
            self.__copyTexture(source, dest)
            return dest
        else:
            return ''

    def __copyTexture(self, source, dest):
        if os.path.exists(source):
            if not self._isHashEqual(source, dest):
                commonFunction.cpByFile(source, dest)
                print '\n\tExport texture %s to %s!\n' % (source, dest)
        else:
            print '\n\tTexture %s did not exist!\n' % source

    def __findPBRTexturesFromMaterial(self, material):
        def findPBRTextures(textureDir, textureBaseName, textureExt, shortName):
            texture = os.path.join(textureDir, '%s_%s.%s' % (textureBaseName, shortName, textureExt))
            if os.path.exists(texture):
                return texture
            else:
                print '\n\tMaterial %s has no %s!\n' % (material, texture)
                return ''

        textures = mc.listConnections('%s.color' % material, s=True, type='file')
        if textures:
            texturePath = mc.getAttr(textures[0] + '.ftn')
            if os.path.exists(texturePath):
                textureDir = os.path.dirname(texturePath)
                textureBaseName = '_'.join(os.path.basename(texturePath).split('.')[0].split('_')[:-1])
                textureExt = os.path.basename(texturePath).split('.')[1]
                di = {}

                for k, v in self._PBRChannelDict.items():
                    di[k] = findPBRTextures(textureDir, textureBaseName, textureExt, v)

                return di
            else:
                print '\n\tMaterial %s has no color file!\n' % material
        else:
            print '\n\tMaterial %s has no color file!\n' % material

        return None

    def __getMaterialRenderingMode(self, materialName):
        if '_transparent_' in materialName:
            return 'transparent'
        elif '_cutout_' in materialName:
            return 'cutout'
        elif '_fade_' in materialName:
            return 'fade'
        else:
            return 'opaque'

    def __getMaterialsFromMesh(self, meshNode):
        li = []

        mc.select(cl=True)
        mc.select(meshNode)
        allChildren = []
        commonFunction.getAllChildren(meshNode, allChildren, 'transform', True)
        for eachChild in allChildren:
            # Get the shader groups attached to this particular object
            shaderGroups = mc.listConnections(mc.listHistory(eachChild))
            if shaderGroups is not None:
                # Get the material attached to the shader group
                _materials = [x for x in mc.ls(mc.listConnections(shaderGroups), materials=True)]

                materials = []
                for mat in _materials:
                    if mat not in materials:
                        materials.append(mat)

                mats = []
                for mat in materials:
                    di = self.__findPBRTexturesFromMaterial(mat)
                    if di:
                        matInfo = dict()

                        matInfo['Material'] = mat
                        matInfo['RenderingMode'] = self.__getMaterialRenderingMode(mat)

                        for k, v in self._PBRChannelDict.items():
                            matInfo[k] = di[k]

                        mats.append(matInfo)

                di = dict()
                # mesh name should be short name
                di['Mesh'] = eachChild.split('|')[-1]
                di['Materials'] = mats
                li.append(di)
        mc.select(cl=True)

        return li

    def __loadExportPresetFile(self, fbxexportpreset):
        batchRoot = os.path.dirname(os.path.split(__file__)[0])

        # if exportType == 'anim':
        presetFilePath = os.path.join(batchRoot, 'Conf/%s.fbxexportpreset' % fbxexportpreset)

        cmd = ('FBXLoadExportPresetFile -f "%s"' % presetFilePath).replace('\\', '/')
        mm.eval(cmd)

    def _exportFBX(self, presetFile, nodes, exportPath):
        self.__loadExportPresetFile(presetFile)

        # export fbx
        mc.select(cl=True)

        for node in nodes:
            mc.select(node, add=True)

        if os.path.exists(exportPath):
            fileAttr = os.stat(exportPath)[0]
            if not fileAttr & stat.S_IWRITE:
                # File is read-only, so make it writeable
                os.chmod(exportPath, stat.S_IWRITE)

        mc.file(exportPath, force=True, options='v=0;p=17;f=0', typ='FBX export', pr=True, es=True)

        print '\n\tExport fbx to %s!\n' % exportPath

    def _renameMaterial(self, materialName):
        """
        Use this function to deal with reference issues
        :return:
        """
        return materialName

    def _exportTextures(self, nodeName, exportTexturePath):
        datas = self.__getMaterialsFromMesh(nodeName)

        for i in range(len(datas)):
            data = datas[i]
            materials = data['Materials']
            for j in range(len(materials)):
                self._processPBRTextures(exportTexturePath, nodeName, materials[j])

        return datas

    def _exportMetaInfo(self, datas, exportPath, assetName):
        fbxPath = os.path.join(exportPath, '%s.fbx' % assetName)
        # get fbx materials
        if os.path.exists(fbxPath):
            wrapperInstance = FBXWrapper(fbxPath)
            meshMaterialDict = wrapperInstance.meshMaterialDict

            for i in range(len(datas)):
                data = datas[i]

                # new material order should match with fbx
                if data['Mesh'] in meshMaterialDict:
                    newMaterials = []

                    fbxMaterials = meshMaterialDict[data['Mesh']]
                    for fbxMaterial in fbxMaterials:
                        for metaMaterial in data['Materials']:
                            if metaMaterial['Material'] == fbxMaterial:

                                # before save meta material, we need to process material name
                                metaMaterial['Material'] = self._renameMaterial(fbxMaterial)

                                newMaterials.append(metaMaterial)
                                break

                    if len(newMaterials) != len(data['Materials']):
                        print 'FBX material count can not match meta materials!'
                    else:
                        data['Materials'] = newMaterials
                else:
                    print 'Can not find mesh name "%s" in fbx file!' % data['Mesh']
        else:
            print 'I can not find fbx file %s' % fbxPath

        # export material config file
        metaPath = os.path.join(exportPath, '%s_meta.json' % assetName)
        jsonIO.JsonWrite(datas, metaPath)
        print '\n\tExport meta data info to %s!\n' % metaPath

    def _processPBRTextures(self, exportTexturePath, nodeName, material):
        for k, v in self._PBRChannelDict.items():
            material[k] = '/' + os.path.basename(self.__exportTexture(exportTexturePath, material[k]))


