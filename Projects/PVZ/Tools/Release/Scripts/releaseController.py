#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/04/16
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : releaseController.py


from Core.MayaGUI.LitFrame.controller import Controller


class ReleaseController(Controller):
    @property
    def _viewInstance(self):
        import releaseView
        return releaseView.ReleaseView()

    @property
    def _modelInstance(self):
        import releaseModel
        return releaseModel.ReleaseModel()

    @property
    def _view2ModelMsg(self):
        return {}

    @property
    def _model2ViewMsg(self):
        return {}
