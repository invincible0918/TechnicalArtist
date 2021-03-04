#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/01/10
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : exporterController.py


from Core.MayaGUI.LitFrame.controller import Controller


class ExporterController(Controller):
    @property
    def _viewInstance(self):
        import exporterView
        reload(exporterView)
        return exporterView.ExporterView()

    @property
    def _modelInstance(self):
        import exporterModel
        reload(exporterModel)
        return exporterModel.ExporterModel()

    @property
    def _view2ModelMsg(self):
        return {'export': 'export',
                'reference': 'reference'}

    @property
    def _model2ViewMsg(self):
        return {'log': 'log',
                'maya_files': 'maya_files'}

    def run(self, **kwargs):
        self._view = self._viewInstance
        self._view.setController(self)
        self._view.lateInit()

        self._model = self._modelInstance
        self._model.setController(self)
        self._model.lateInit()

        self._view.show()
