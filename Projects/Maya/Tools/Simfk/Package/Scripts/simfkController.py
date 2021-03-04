#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2021/01/05
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : simfkController.py


from Core.MayaGUI.LitFrame.controller import Controller


class SimfkController(Controller):
    @property
    def _viewInstance(self):
        import simfkView
        reload(simfkView)
        return simfkView.SimfkView()

    @property
    def _modelInstance(self):
        import simfkModel
        reload(simfkModel)
        return simfkModel.SimfkModel()

    @property
    def _view2ModelMsg(self):
        return {}

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

        # self._view.show()
