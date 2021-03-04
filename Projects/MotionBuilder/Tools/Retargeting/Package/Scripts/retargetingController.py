#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/03/15
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : retargetingController.py


from Core.MotionBuilderGUI.LitFrame.controller import Controller


class RetargetingController(Controller):
    @property
    def _viewInstance(self):
        import retargetingView
        return retargetingView.RetargetingView()

    @property
    def _modelInstance(self):
        import retargetingModel
        return retargetingModel.RetargetingModel()

    @property
    def _view2ModelMsg(self):
        return {}

    @property
    def _model2ViewMsg(self):
        return {}
