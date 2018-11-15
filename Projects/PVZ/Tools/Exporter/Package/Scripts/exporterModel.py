#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/04/18
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : exporterModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from Core.IO.YAML import yamlIO
from Core.MayaGUI import dialog
from Common.Tools.LocalFileSystem import main
from animExporter import AnimExporter
from modelExporter import ModelExporter
from previewExporter import PreviewExporter


class ExporterModel(Model):
    def __exportProp(self, *args):
        exporter = ModelExporter(**{'exportPaths': self.__exportPaths})
        exporter.exportProp()

    def __exportAnimedProp(self, *args):
        exporter = ModelExporter(**{'exportPaths': self.__exportPaths})
        exporter.exportAnimedProp()

    def __exportPreviewModel(self, *args):
        exporter = PreviewExporter(**{'exportPaths': self.__exportPaths})
        exporter.exportPreviewModel()

    def __exportTPose(self, *args):
        exporter = AnimExporter(**{'exportPaths': self.__exportPaths})
        exporter.exportTPose()

    def __exportAnim(self, *args):
        exporter = AnimExporter(**{'exportPaths': self.__exportPaths})
        exporter.exportAnimClip()

    def lateInit(self, **kwargs):
        super(ExporterModel, self).lateInit(**kwargs)

        self.__exportFunction = {'tpose': self.__exportTPose,
                                 'anim': self.__exportAnim,
                                 'prop': self.__exportProp,
                                 'animedProp': self.__exportAnimedProp,
                                 'previewModel': self.__exportPreviewModel}

        self.__exportPaths = []

        # load pvz branch data
        self.__pvzBranchPath = main.getFile('pvz/pvzBranch.yaml')
        if os.path.exists(self.__pvzBranchPath):
            self.__pvzBranchData = yamlIO.read(self.__pvzBranchPath)
            self._sendMessage('branchPath', self.__pvzBranchData)
        else:
            gui = dialog.ConfirmDialog2(**{'message': 'Can\'t get pvz branch, please restart maya.'})
            gui.show()

        self.__exportConfig = main.getFile('pvz/exportConfig.yaml')
        if os.path.exists(self.__exportConfig):
            self.__exportConfigData = yamlIO.read(self.__exportConfig)
            self._sendMessage('exportConfigData', self.__exportConfigData)
        else:
            self.__exportConfigData = dict()

    # public method
    def export(self, exportType):
        self.__exportPaths = [value['workspace'] for value in self.__pvzBranchData.values() if value['checked']]
        if exportType in self.__exportFunction:
            self.__exportFunction[exportType]()
        else:
            print '%s function doesn\'t exist!' % type

    def exportBranch(self, depot, exported):
        self.__pvzBranchData[depot]['checked'] = exported
        yamlIO.write(self.__pvzBranchPath, self.__pvzBranchData)

    def changeExportIndex(self, index):
        self.__exportConfigData['exportTabIndex'] = index
        yamlIO.write(self.__exportConfig, self.__exportConfigData)
