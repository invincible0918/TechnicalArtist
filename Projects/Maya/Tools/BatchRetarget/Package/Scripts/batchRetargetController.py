#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/07/25
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : batchRetargetController.py


from Core.MayaGUI.LitFrame.controller import Controller


class BatchRetargetController(Controller):
    @property
    def _viewInstance(self):
        import batchRetargetView
        reload(batchRetargetView)
        return batchRetargetView.BatchRetargetView()

    @property
    def _modelInstance(self):
        import batchRetargetModel
        reload(batchRetargetModel)
        return batchRetargetModel.BatchRetargetModel()

    @property
    def _view2ModelMsg(self):
        return {'batch_import_in_maya': 'batch_import_in_maya',
                'batch_remove_in_maya': 'batch_remove_in_maya',
                'batch_retarget_in_maya': 'batch_retarget_in_maya'}

    @property
    def _model2ViewMsg(self):
        return {}

    def run(self, **kwargs):
        self._view = self._viewInstance
        self._view.setController(self)
        self._view.lateInit()

        self._model = self._modelInstance
        self._model.setController(self)
        self._model.lateInit()

        self._view.show()
