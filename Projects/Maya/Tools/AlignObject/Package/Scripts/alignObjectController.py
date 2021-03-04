#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/06/03
# @Company : INVINCIBLE STUDIO
# @Author  : Sun Jing
# @Email   : jing.sun4@ubisoft.com
# @File    : alignObjectController.py


from Core.MayaGUI.LitFrame.controller import Controller


class AlignObjectController(Controller):
    @property
    def _viewInstance(self):
        import alignObjectView
        reload(alignObjectView)
        return alignObjectView.AlignObjectView()

    @property
    def _modelInstance(self):
        import alignObjectModel
        reload(alignObjectModel)
        return alignObjectModel.AlignObjectModel()

    @property
    def _view2ModelMsg(self):
        return {"select_objects": "select_objects",
                "bake_objects": "bake_objects",
                "add_to_list":"add_to_list",
                "get_selected_list":"get_selected_list",
                "bake_animations":"bake_animations",
                "export_locators":"export_locators",
                "create_locators":"create_locators",
                "get_time_range":"get_time_range"}

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
