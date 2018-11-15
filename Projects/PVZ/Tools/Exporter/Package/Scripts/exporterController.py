#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/04/18
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : exporterController.py


from Core.MayaGUI.LitFrame.controller import Controller


class ExporterController(Controller):
    @property
    def _viewInstance(self):
        import exporterView
        return exporterView.ExporterView()

    @property
    def _modelInstance(self):
        import exporterModel
        return exporterModel.ExporterModel()

    @property
    def _view2ModelMsg(self):
        return {'export': 'export',
                'exportBranch': 'exportBranch',
                'changeExportIndex': 'changeExportIndex'}

    @property
    def _model2ViewMsg(self):
        return {'branchPath': 'branchPath',
                'exportConfigData': 'exportConfigData'}

    def run(self, **kwargs):
        self._view = self._viewInstance
        self._view.setController(self)
        self._view.lateInit(**kwargs)

        self._model = self._modelInstance
        self._model.setController(self)
        self._model.lateInit(**kwargs)

        self._view.show()
