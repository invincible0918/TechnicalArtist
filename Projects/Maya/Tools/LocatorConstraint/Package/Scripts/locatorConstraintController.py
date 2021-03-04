#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/16
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : locatorConstraintController.py


from Core.MayaGUI.LitFrame.controller import Controller


class LocatorConstraintController(Controller):
    @property
    def _viewInstance(self):
        import locatorConstraintView
        reload(locatorConstraintView)
        return locatorConstraintView.LocatorConstraintView()

    @property
    def _modelInstance(self):
        import locatorConstraintModel
        reload(locatorConstraintModel)
        return locatorConstraintModel.LocatorConstraintModel()

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
