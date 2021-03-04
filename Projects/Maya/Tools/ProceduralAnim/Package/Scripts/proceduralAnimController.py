#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/03/26
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : proceduralAnimController.py


from Core.MayaGUI.LitFrame.controller import Controller


class ProceduralAnimController(Controller):
    @property
    def _viewInstance(self):
        import proceduralAnimView
        reload(proceduralAnimView)
        return proceduralAnimView.ProceduralAnimView()

    @property
    def _modelInstance(self):
        import proceduralAnimModel
        reload(proceduralAnimModel)
        return proceduralAnimModel.ProceduralAnimModel()

    @property
    def _view2ModelMsg(self):
        return {'keyframe_data': 'keyframe_data',
                'delete': 'delete',
                'select': 'select',
                'save': 'save',
                'load': 'load',
                'delete_all_keyframes': 'delete_all_keyframes'}

    @property
    def _model2ViewMsg(self):
        return {'keyframe_datas': 'keyframe_datas',
                'save': 'save',
                'load': 'load'}

    def run(self, **kwargs):
        self._view = self._viewInstance
        self._view.setController(self)
        self._view.lateInit()

        self._model = self._modelInstance
        self._model.setController(self)
        self._model.lateInit()

        self._view.show()
