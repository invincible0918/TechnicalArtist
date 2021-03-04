#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/03/08
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : mBConsoleController.py


from Core.MotionBuilderGUI.LitFrame.controller import Controller


class MBConsoleController(Controller):
    @property
    def _viewInstance(self):
        import mBConsoleView
        return mBConsoleView.MBConsoleView()

    @property
    def _modelInstance(self):
        import mBConsoleModel
        return mBConsoleModel.MBConsoleModel()

    @property
    def _view2ModelMsg(self):
        return {}

    @property
    def _model2ViewMsg(self):
        return {}
