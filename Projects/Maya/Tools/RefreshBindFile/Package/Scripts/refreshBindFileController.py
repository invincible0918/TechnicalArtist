#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/23
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : refreshBindFileController.py


from Core.MayaGUI.LitFrame.controller import Controller


class RefreshBindFileController(Controller):
    @property
    def _viewInstance(self):
        import refreshBindFileView
        reload(refreshBindFileView)
        return refreshBindFileView.RefreshBindFileView()

    @property
    def _modelInstance(self):
        import refreshBindFileModel
        reload(refreshBindFileModel)
        return refreshBindFileModel.RefreshBindFileModel()

    @property
    def _view2ModelMsg(self):
        return {'export_skeleton': 'export_skeleton',
                'update_bind': 'update_bind',
                'export': 'export',
                'open': 'open'
                }

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
