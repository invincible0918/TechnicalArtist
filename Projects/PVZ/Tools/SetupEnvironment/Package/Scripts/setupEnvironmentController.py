#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/04/18
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : setupEnvironmentController.py


from Core.MayaGUI.LitFrame.controller import Controller


class SetupEnvironmentController(Controller):
    @property
    def _viewInstance(self):
        import setupEnvironmentView
        return setupEnvironmentView.SetupEnvironmentView()

    @property
    def _modelInstance(self):
        import setupEnvironmentModel
        return setupEnvironmentModel.SetupEnvironmentModel()

    @property
    def _view2ModelMsg(self):
        return {'userInfo': 'userInfo'}

    @property
    def _model2ViewMsg(self):
        return {'config': 'config',
                'branchPath': 'branchPath'}
