#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/04/16
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
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
