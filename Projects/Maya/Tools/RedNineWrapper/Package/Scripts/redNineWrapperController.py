#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/04/17
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : redNineWrapperController.py


from Core.MayaGUI.LitFrame.controller import Controller


class RedNineWrapperController(Controller):
    @property
    def _viewInstance(self):
        import redNineWrapperView
        return redNineWrapperView.RedNineWrapperView()

    @property
    def _modelInstance(self):
        import redNineWrapperModel
        return redNineWrapperModel.RedNineWrapperModel()

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
