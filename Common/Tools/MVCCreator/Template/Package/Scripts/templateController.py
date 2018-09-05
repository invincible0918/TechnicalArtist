#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : YYYY/MM/DD
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : templateController.py


from Core.MayaGUI.LitFrame.controller import Controller


class TemplateController(Controller):
    @property
    def _viewInstance(self):
        import templateView
        return templateView.TemplateView()

    @property
    def _modelInstance(self):
        import templateModel
        return templateModel.TemplateModel()

    @property
    def _view2ModelMsg(self):
        return {}

    @property
    def _model2ViewMsg(self):
        return {}
