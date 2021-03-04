#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/7/11
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : exportTexturesController.py


from Core.MayaGUI.LitFrame.controller import Controller


class ReplaceNodeController(Controller):
    @property
    def _viewInstance(self):
        import replaceNodeView
        return replaceNodeView.ReplaceNodeView()

    @property
    def _modelInstance(self):
        import replaceNodeModel
        return replaceNodeModel.ReplaceNodeModel()

    @property
    def _view2ModelMsg(self):
        return {'doIt': 'doIt'}
