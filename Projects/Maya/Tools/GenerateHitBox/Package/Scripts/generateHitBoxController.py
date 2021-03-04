#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/23
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : generateHitBoxController.py


from Core.MayaGUI.LitFrame.controller import Controller


class GenerateHitBoxController(Controller):
    @property
    def _viewInstance(self):
        import generateHitBoxView
        reload(generateHitBoxView)
        return generateHitBoxView.GenerateHitBoxView()

    @property
    def _modelInstance(self):
        import generateHitBoxModel
        reload(generateHitBoxModel)
        return generateHitBoxModel.GenerateHitBoxModel()

    @property
    def _view2ModelMsg(self):
        return {'generate': 'generate',
                'delete': 'delete',
                'save': 'save'}

    @property
    def _model2ViewMsg(self):
        return {'log': 'log'}

    def run(self, **kwargs):
        self._view = self._viewInstance
        self._view.setController(self)
        self._view.lateInit()

        self._model = self._modelInstance
        self._model.setController(self)
        self._model.lateInit()

        self._view.show()
