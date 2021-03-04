#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/01/08
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : ragdollToolController.py


from Core.MayaGUI.LitFrame.controller import Controller


class RagdollToolController(Controller):
    @property
    def _viewInstance(self):
        import ragdollToolView
        reload(ragdollToolView)
        return ragdollToolView.RagdollToolView()

    @property
    def _modelInstance(self):
        import ragdollToolModel
        reload(ragdollToolModel)
        return ragdollToolModel.RagdollToolModel()

    @property
    def _view2ModelMsg(self):
        return {'ragdoll_parameters': 'ragdoll_parameters'}

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
