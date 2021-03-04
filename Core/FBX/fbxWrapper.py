#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 7/19/2018
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : fbxWrapper.py

try:
    import os
    scriptDir = os.path.dirname(os.path.realpath(__file__))
    import sys
    if scriptDir not in sys.path:
        sys.path.append(scriptDir)

    from FbxCommon import *
    import fbxsip
except ImportError:
    print("Error: module FbxCommon and/or module fbxsip failed to import.\n")
    print(
    "Copy the files located in the compatible sub-folder lib/python<version> into your python interpreter site-packages folder.")
    import platform

    if platform.system() == 'Windows' or platform.system() == 'Microsoft':
        print('For example: copy ..\\..\\lib\\Python27_x64\\* C:\\Python27\\Lib\\site-packages')
    elif platform.system() == 'Linux':
        print('For example: cp ../../lib/Python27_x64/* /usr/local/lib/python2.7/site-packages')
    elif platform.system() == 'Darwin':
        print(
        'For example: cp ../../lib/Python27_x64/* /Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages')

# Prepare the FBX SDK.
print '\n\tBegin to InitializeSdkObjects ...'
lSdkManager, lScene = InitializeSdkObjects()
print '\n\tInitializeSdkObjects Successfully!'


class FBXWrapper(object):
    def __init__(self, fbxFilePath):
        # Prepare the FBX SDK.
        lSdkManager, lScene = InitializeSdkObjects()

        # The example can take a FBX file as an argument.
        if len(fbxFilePath) > 1:
            print("\n\nFile: %s\n" % fbxFilePath)
            lResult = LoadScene(lSdkManager, lScene, fbxFilePath)
        else:
            lResult = False

        if not lResult:
            print("\n\nAn error occurred while loading the scene...")
        else:
            self.__postInit()
            lNode = lScene.GetRootNode()
            self.__iterAllAnimations(lNode, lSdkManager)
            self.__iterAllMeshes(lNode, lSdkManager)

    @property
    def meshMaterialDict(self):
        return self.__meshMaterialDict

    def __postInit(self):
        # key is mesh name, value is material array
        self.__meshMaterialDict = dict()

    def __iterAllAnimations(self, lNode, pManager):
        # lConverter = FbxAnimCurveFilterMatrixConverter(pManager)

        if lNode:
            for i in range(lNode.GetChildCount()):
                lChildNode = lNode.GetChild(i)

                self.__displayAnimation(lChildNode)
                self.__iterAllAnimations(lChildNode, pManager)

    def __displayAnimation(self, node):
        if node.GetNodeAttribute():
            lAttributeType = (node.GetNodeAttribute().GetAttributeType())

            if lAttributeType == FbxNodeAttribute.eSkeleton:
                pAnimation = node.GetNodeAttribute()

                lNode = None
                if pAnimation:
                    lNode = pAnimation.GetNode()
                    if lNode:
                        print lNode.GetName(), lNode.ScalingMin, lNode.ScalingMax

    def __iterAllMeshes(self, lNode, pManager):
        lConverter = FbxGeometryConverter(pManager)

        if lNode:
            for i in range(lNode.GetChildCount()):
                lChildNode = lNode.GetChild(i)

                # process node lives here
                self.__displayMaterial(lChildNode)

                # continue to iter
                self.__iterAllMeshes(lChildNode, pManager)

    def __displayMaterial(self, node):
        if node.GetNodeAttribute() != None:
            lAttributeType = (node.GetNodeAttribute().GetAttributeType())

            if lAttributeType == FbxNodeAttribute.eMesh:
                pGeometry = node.GetNodeAttribute()

                lMaterialCount = 0
                lNode = None
                if pGeometry:
                    lNode = pGeometry.GetNode()
                    if lNode:
                        lMaterialCount = lNode.GetMaterialCount()

                meshName = lNode.GetName()
                self.__meshMaterialDict[meshName] = []
                print("        Node Name ", lNode.GetName())

                for l in range(pGeometry.GetLayerCount()):
                    leMat = pGeometry.GetLayer(l).GetMaterials()
                    if leMat:
                        if leMat.GetReferenceMode() == FbxLayerElement.eIndex:
                            # Materials are in an undefined external table
                            continue

                        if lMaterialCount > 0:
                            theColor = FbxColor()

                            header = "    Materials on layer %d: " % l
                            print(header)

                            for lCount in range(lMaterialCount):
                                print("        Material ", lCount)

                                lMaterial = lNode.GetMaterial(lCount)

                                print("            Name: \"", lMaterial.GetName(), "\"")
                                self.__meshMaterialDict[meshName].append(lMaterial.GetName())

                                # Get the implementation to see if it's a hardware shader.
                                lImplementation = GetImplementation(lMaterial, "ImplementationHLSL")
                                lImplemenationType = "HLSL"
                                if not lImplementation:
                                    lImplementation = GetImplementation(lMaterial, "ImplementationCGFX")
                                    lImplemenationType = "CGFX"
                                if lImplementation:
                                    # Now we have a hardware shader, let's read it
                                    print("            Hardware Shader Type: %s\n" % lImplemenationType.Buffer())
                                    lRootTable = lImplementation.GetRootTable()
                                    lFileName = lRootTable.DescAbsoluteURL.Get()
                                    lTechniqueName = lRootTable.DescTAG.Get()

                                    lTable = lImplementation.GetRootTable()
                                    lEntryNum = lTable.GetEntryCount()

                                    for i in range(lEntryNum):
                                        lEntry = lTable.GetEntry(i)
                                        lEntry.GetEntryType(True)

                                        lTest = lEntry.GetSource()
                                        print("            Entry: %s\n" % lTest.Buffer())

                                        if cmp(FbxPropertyEntryView.sEntryType, lEntrySrcType) == 0:
                                            lFbxProp = lMaterial.FindPropertyHierarchical(lEntry.GetSource())
                                            if not lFbxProp.IsValid():
                                                lFbxProp = lMaterial.RootProperty.FindHierarchical(lEntry.GetSource())
                                        elif cmp(FbxConstantEntryView.sEntryType, lEntrySrcType) == 0:
                                            lFbxProp = lImplementation.GetConstants().FindHierarchical(lEntry.GetSource())

                                        if lFbxProp.IsValid():
                                            if lFbxProp.GetSrcObjectCount(FbxCriteria.ObjectType(FbxTexture.ClassId)) > 0:
                                                # do what you want with the texture
                                                for j in range(
                                                        lFbxProp.GetSrcObjectCount(FbxCriteria.ObjectType(FbxTexture.ClassId))):
                                                    lTex = lFbxProp.GetSrcObject(FbxCriteria.ObjectType(FbxTexture.ClassId), j)
                                                    print("                Texture: %s\n" % lTex.GetFileName())
                                            else:
                                                lFbxType = lFbxProp.GetPropertyDataType()
                                                if (lFbxType == eFbxBool):
                                                    lFbxProp = FbxPropertyBool1(lFbxProp)
                                                    print("                Bool: ", lFbxProp.Get())
                                                elif (lFbxType == eFbxInt):
                                                    lFbxProp = FbxPropertyInteger1(lFbxProp)
                                                    print("                Int: ", lFbxProp.Get())
                                                elif (lFbxType == eFbxEnum):
                                                    lFbxProp = FbxPropertyEnum(lFbxProp)
                                                    print("                Enum: ", lFbxProp.Get())
                                                elif (lFbxType == eFbxFloat):
                                                    lFbxProp = FbxPropertyFloat1(lFbxProp)
                                                    print("                Float: ", lFbxProp.Get())
                                                elif (lFbxType == eFbxDouble):
                                                    lFbxProp = FbxPropertyDouble1(lFbxProp)
                                                    print("                Double: ", lFbxProp.Get())
                                                elif (lFbxType == eFbxString):
                                                    lFbxProp = FbxPropertyString(lFbxProp)
                                                    print("                String: ", lFbxProp.Get())
                                                elif (lFbxType == eFbxDouble2):
                                                    lFbxProp = FbxPropertyDouble2(lFbxProp)
                                                    res, lDouble2 = lFbxProp.Get()
                                                    lVect = []
                                                    lVect[0] = lDouble2[0]
                                                    lVect[1] = lDouble2[1]
                                                    print("                2D vector: ", lVect)
                                                elif (lFbxType == eFbxDouble3):
                                                    lFbxProp = FbxPropertyDouble3(lFbxProp)
                                                    res, lDouble3 = lFbxProp.Get()
                                                    lVect = []
                                                    lVect[0] = lDouble3[0]
                                                    lVect[1] = lDouble3[1]
                                                    lVect[2] = lDouble3[2]
                                                    print("                3D vector: ", lVect)
                                                elif (lFbxType == eFbxDouble4):
                                                    lFbxProp = FbxPropertyDouble4(lFbxProp)
                                                    res, lDouble4 = lFbxProp.Get()
                                                    lVect = []
                                                    lVect[0] = lDouble4[0]
                                                    lVect[1] = lDouble4[1]
                                                    lVect[2] = lDouble4[2]
                                                    lVect[3] = lDouble4[3]
                                                    print("                4D vector: ", lVect)
                                                elif (lFbxType == eFbxDouble4x4):
                                                    lFbxProp = FbxPropertyXMatrix(lFbxProp)
                                                    res, lDouble44 = lFbxProp.Get(EFbxType.eFbxDouble44)
                                                    for j in range(4):
                                                        lVect = []
                                                        lVect[0] = lDouble44[j][0]
                                                        lVect[1] = lDouble44[j][1]
                                                        lVect[2] = lDouble44[j][2]
                                                        lVect[3] = lDouble44[j][3]
                                                        print("                4x4D vector: ", lVect)

                                elif (lMaterial.GetClassId().Is(FbxSurfacePhong.ClassId)):
                                    # We found a Phong material.  Display its properties.

                                    # Display the Ambient Color
                                    lFbxDouble3 = lMaterial.Ambient
                                    theColor.Set(lFbxDouble3.Get()[0], lFbxDouble3.Get()[1], lFbxDouble3.Get()[2])
                                    print("            Ambient: ", theColor)

                                    # Display the Diffuse Color
                                    lFbxDouble3 = lMaterial.Diffuse
                                    theColor.Set(lFbxDouble3.Get()[0], lFbxDouble3.Get()[1], lFbxDouble3.Get()[2])
                                    print("            Diffuse: ", theColor)

                                    # Display the Specular Color (unique to Phong materials)
                                    lFbxDouble3 = lMaterial.Specular
                                    theColor.Set(lFbxDouble3.Get()[0], lFbxDouble3.Get()[1], lFbxDouble3.Get()[2])
                                    print("            Specular: ", theColor)

                                    # Display the Emissive Color
                                    lFbxDouble3 = lMaterial.Emissive
                                    theColor.Set(lFbxDouble3.Get()[0], lFbxDouble3.Get()[1], lFbxDouble3.Get()[2])
                                    print("            Emissive: ", theColor)

                                    # Opacity is Transparency factor now
                                    lFbxDouble1 = lMaterial.TransparencyFactor
                                    print("            Opacity: ", 1.0 - lFbxDouble1.Get())

                                    # Display the Shininess
                                    lFbxDouble1 = lMaterial.Shininess
                                    print("            Shininess: ", lFbxDouble1.Get())

                                    # Display the Reflectivity
                                    lFbxDouble3 = lMaterial.Reflection
                                    theColor.Set(lFbxDouble3.Get()[0], lFbxDouble3.Get()[1], lFbxDouble3.Get()[2])
                                    print("            Reflectivity: ", theColor)
                                elif lMaterial.GetClassId().Is(FbxSurfaceLambert.ClassId):
                                    # We found a Lambert material. Display its properties.
                                    # Display the Ambient Color
                                    lFbxDouble3 = lMaterial.Ambient
                                    theColor.Set(lFbxDouble3.Get()[0], lFbxDouble3.Get()[1], lFbxDouble3.Get()[2])
                                    print("            Ambient: ", theColor)

                                    # Display the Diffuse Color
                                    lFbxDouble3 = lMaterial.Diffuse
                                    theColor.Set(lFbxDouble3.Get()[0], lFbxDouble3.Get()[1], lFbxDouble3.Get()[2])
                                    print("            Diffuse: ", theColor)

                                    # Display the Emissive
                                    lFbxDouble3 = lMaterial.Emissive
                                    theColor.Set(lFbxDouble3.Get()[0], lFbxDouble3.Get()[1], lFbxDouble3.Get()[2])
                                    print("            Emissive: ", theColor)

                                    # Display the Opacity
                                    lFbxDouble1 = lMaterial.TransparencyFactor
                                    print("            Opacity: ", 1.0 - lFbxDouble1.Get())
                                else:
                                    print("Unknown type of Material")

                                lString = lMaterial.ShadingModel
                                print("            Shading Model: ", lString.Get().Buffer())
                                print("")


# if __name__ == "__main__":
#     import re
#     from Core.IO.JSON import jsonIO
#
#     wrapperInstance = FBXWrapper(r'F:\\Projects\\PVZCommando\\main\unity/Assets/_Assets/ABSrc\zombies\allstar\avatar\002\body\zombie_allstar_002_body_lod0.fbx')
#     meshMaterialDict = wrapperInstance.meshMaterialDict
#
#     jr = jsonIO.JsonRead(r'F:\Projects\PVZCommando\main\unity\Assets\_Assets\ABSrc\zombies\allstar\avatar\002\body\zombie_allstar_002_body_lod0_meta.json')
#     dataList = jr.data
#
#     for i in range(len(dataList)):
#         data = dataList[i]
#
#         # new material order should match with fbx
#         if data['Mesh'] in meshMaterialDict:
#             newMaterials = []
#
#             fbxMaterials = meshMaterialDict[data['Mesh']]
#             for fbxMaterial in fbxMaterials:
#                 for metaMaterial in data['Materials']:
#                     if metaMaterial['Material'] == fbxMaterial:
#                         metaMaterial['Material'] = re.sub(r'_mat\d+$', '_mat', fbxMaterial)
#                         newMaterials.append(metaMaterial)
#                         break
#
#             if len(newMaterials) != len(data['Materials']):
#                 print 'FBX material count can not match meta materials!'
#             else:
#                 data['Materials'] = newMaterials
#         else:
#             print 'Can not find mesh name %s in meta', data['Mesh']
#
#     print dataList

