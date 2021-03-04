#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/06/06
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : legSetupController.py


from Core.MayaGUI.LitFrame.controller import Controller


class LegSetupController(Controller):
    @property
    def _viewInstance(self):
        import legSetupView
        reload(legSetupView)
        return legSetupView.LegSetupView()

    @property
    def _modelInstance(self):
        import legSetupModel
        reload(legSetupModel)
        return legSetupModel.LegSetupModel()

    @property
    def _view2ModelMsg(self):
        return {'do': 'do'}

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
