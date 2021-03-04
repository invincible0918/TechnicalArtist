#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/12/01
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : relativePathModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from Core.MayaGUI import dialog
from maya import cmds as mc


class RelativePathModel(Model):
    def lateInit(self):
        currentWorkspace = mc.workspace(q=True, rd=True)

        errorList = []
        for node in mc.ls(type='file'):
            path = mc.getAttr(node + '.ftn')

            if currentWorkspace not in path:
                errorList.append('Path "%s" didn\'t in the current workspace "%s".' %(path, currentWorkspace))
            else:
                n = path.replace(currentWorkspace, '')
                mc.setAttr(node + '.ftn', n, typ='string')

        if errorList:
            msg = '\n\n'.join(errorList)
            gui = dialog.ConfirmDialog2(**{'message': msg})
            gui.show()
