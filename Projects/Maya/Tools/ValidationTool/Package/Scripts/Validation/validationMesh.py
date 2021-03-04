#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 7/12/2018
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : validationMesh.py


from Core.MayaGUI import dialog
from validation import Validation
from maya import cmds as mc
import os


class ValidationMesh(Validation):
    def validation(self, *args):
        """
        Only work in model file
        :return:
        """
        mayaFile = mc.file(q=True, sn=True)
        arr = mayaFile.split('/')
        if arr[-2] != 'models':
            return

        self.__checkMeshWithDuplicationName()
        self.__checkWrongTransformNode()
        self.__checkWrongShapeNode()

    def __checkMeshWithDuplicationName(self):
        errLog = ''
        for meshNode in mc.ls(type='mesh'):
            transformNode = mc.listRelatives(meshNode, p=True)[0]
            try:
                mc.select(cl=True)
                mc.select(transformNode, r=True)
            except Exception as e:
                errLog += '%s\n' % e.args

        if errLog:
            gui = dialog.ConfirmDialog2(**{'message': errLog})
            gui.show()

    def __checkWrongTransformNode(self):
        errLog = ''
        characterName = os.path.basename(mc.file(q=True, sn=True)).split('.')[0]
        for meshNode in mc.ls(type='mesh'):
            transformNode = mc.listRelatives(meshNode, p=True)[0]
            if not transformNode.startswith(characterName):
                errLog += '"%s" is a invalid name\n, it should start with "%s"' % (transformNode, characterName)

        if errLog:
            gui = dialog.ConfirmDialog2(**{'message': errLog})
            gui.show()

    def __checkWrongShapeNode(self):
        errLog = ''
        for meshNode in mc.ls(type='mesh'):
            transformNode = mc.listRelatives(meshNode, p=True)[0]
            shapeNode = meshNode.split('|')[-1].split('Shape')[0]
            if transformNode != shapeNode:
                errLog += 'Transform node name "%s" doesn\'t match its shape node name "%s", ' \
                          '{$transformNode$}|{$transformNode$}Shape, please delete histroy!' % (transformNode, shapeNode)

        if errLog:
            gui = dialog.ConfirmDialog2(**{'message': errLog})
            gui.show()
