#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/05/02
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : retargetByMobuController.py


from Core.MayaGUI.LitFrame.controller import Controller


class RetargetByMobuController(Controller):
    @property
    def _viewInstance(self):
        import retargetByMobuView
        reload(retargetByMobuView)
        return retargetByMobuView.RetargetByMobuView()

    @property
    def _modelInstance(self):
        import retargetByMobuModel
        reload(retargetByMobuModel)
        return retargetByMobuModel.RetargetByMobuModel()

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