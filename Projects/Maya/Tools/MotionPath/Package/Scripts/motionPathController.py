#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/18
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : motionPathController.py


from Core.MayaGUI.LitFrame.controller import Controller


class MotionPathController(Controller):
    @property
    def _viewInstance(self):
        import motionPathView
        reload(motionPathView)
        return motionPathView.MotionPathView()

    @property
    def _modelInstance(self):
        import motionPathModel
        reload(motionPathModel)
        return motionPathModel.MotionPathModel()

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
