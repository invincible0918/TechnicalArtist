#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/02/25
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : prefMarkerController.py


from Core.MayaGUI.LitFrame.controller import Controller


class PrefMarkerController(Controller):
    @property
    def _viewInstance(self):
        import prefMarkerView
        reload(prefMarkerView)
        return prefMarkerView.PrefMarkerView()

    @property
    def _modelInstance(self):
        import prefMarkerModel
        reload(prefMarkerModel)
        return prefMarkerModel.PrefMarkerModel()

    @property
    def _view2ModelMsg(self):
        return {"import_marker_preset": "import_marker_preset",
                "select_the_locator": "select_the_locator",
                "select_the_curve":"select_the_curve",
                "finish_the_rig": "finish_the_rig"}

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
