#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/11/18
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : createDummyBindController.py


from Core.MayaGUI.LitFrame.controller import Controller


class CreateDummyBindController(Controller):
    @property
    def _viewInstance(self):
        import createDummyBindView
        reload(createDummyBindView)
        return createDummyBindView.CreateDummyBindView()

    @property
    def _modelInstance(self):
        import createDummyBindModel
        reload(createDummyBindModel)
        return createDummyBindModel.CreateDummyBindModel()

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
