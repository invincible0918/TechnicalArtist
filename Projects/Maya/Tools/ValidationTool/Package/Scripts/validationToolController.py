#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/27
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : validationToolController.py


from Core.MayaGUI.LitFrame.controller import Controller


class ValidationToolController(Controller):
    @property
    def _viewInstance(self):
        import validationToolView
        reload(validationToolView)
        return validationToolView.ValidationToolView()

    @property
    def _modelInstance(self):
        import validationToolModel
        reload(validationToolModel)
        return validationToolModel.ValidationToolModel()

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
