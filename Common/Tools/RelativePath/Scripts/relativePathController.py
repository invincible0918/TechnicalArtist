#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/12/01
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : relativePathController.py


from Core.MayaGUI.LitFrame.controller import Controller


class RelativePathController(Controller):
    @property
    def _viewInstance(self):
        import relativePathView
        return relativePathView.RelativePathView()

    @property
    def _modelInstance(self):
        import relativePathModel
        return relativePathModel.RelativePathModel()

    @property
    def _view2ModelMsg(self):
        return {}

    @property
    def _model2ViewMsg(self):
        return {}

    def run(self, **kwargs):
        # self._view = self._viewInstance
        # self._view.setController(self)
        # self._view.lateInit()

        self._model = self._modelInstance
        self._model.setController(self)
        self._model.lateInit()

        # self._view.show()
