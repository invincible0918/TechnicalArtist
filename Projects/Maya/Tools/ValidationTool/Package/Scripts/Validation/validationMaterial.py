#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 7/11/2018
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : validationMaterial.py


from Core.MayaGUI import dialog
from validation import Validation
from maya import cmds as mc


class ValidationMaterial(Validation):

    def validation(self, *args):
        """
        Only work in model file
        :return:
        """
        mayaFile = mc.file(q=True, sn=True)
        arr = mayaFile.split('/')
        if arr[-2] != 'models':
            return

        characterType = arr[-1].split('_')[0]
        characterName = arr[-1].split('_')[1]

        materialStartString = '%s_%s' % (characterType, characterName)
        materialEndString = '_mat'

        materials = []
        for mesh in mc.ls(typ='mesh'):
            # Get the shader groups attached to this particular object
            shaderGroups = mc.listConnections(mc.listHistory(mesh))
            if shaderGroups is not None:
                # Get the material attached to the shader group
                _materials = [x for x in mc.ls(mc.listConnections(shaderGroups), materials=True)]

                for mat in _materials:
                    if mat not in materials:
                        materials.append(mat)

        errLog = ''
        for mat in materials:
            if not mat.startswith(materialStartString) or not mat.endswith(materialEndString):
                errLog += '%s\n' % mat

        if errLog:
            message = """
            These materials\' name are wrong: \n%s\n The standard material\'s name should be: \"%s_xxx_mat\"!"
            """ % (errLog, materialStartString)
            gui = dialog.ConfirmDialog2(**{'message': message})
            gui.show()
