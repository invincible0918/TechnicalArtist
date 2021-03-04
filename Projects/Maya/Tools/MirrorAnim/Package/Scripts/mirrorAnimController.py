#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/04/29
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : mirrorAnimController.py


from Core.MayaGUI.LitFrame.controller import Controller


class MirrorAnimController(Controller):
    @property
    def _viewInstance(self):
        import mirrorAnimView
        return mirrorAnimView.MirrorAnimView()

    @property
    def _modelInstance(self):
        import mirrorAnimModel
        return mirrorAnimModel.MirrorAnimModel()

    @property
    def _view2ModelMsg(self):
        return {'mirror': 'mirror'}

    @property
    def _model2ViewMsg(self):
        return {'mirror_plan': 'mirror_plan'}

    def run(self, **kwargs):
        self._view = self._viewInstance
        self._view.setController(self)
        self._view.lateInit()

        self._model = self._modelInstance
        self._model.setController(self)
        self._model.lateInit()

        self._view.show()
