#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : YYYY/MM/DD
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : templateController.py


from Core.MayaGUI.LitFrame.controller import Controller


class TemplateController(Controller):
    @property
    def _viewInstance(self):
        import templateView
        reload(templateView)
        return templateView.TemplateView()

    @property
    def _modelInstance(self):
        import templateModel
        reload(templateModel)
        return templateModel.TemplateModel()

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
