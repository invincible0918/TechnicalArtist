#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/25
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : customRigController.py


from Core.MayaGUI.LitFrame.controller import Controller


class CustomRigController(Controller):
    @property
    def _viewInstance(self):
        import customRigView
        reload(customRigView)
        return customRigView.CustomRigView()

    @property
    def _modelInstance(self):
        import customRigModel
        reload(customRigModel)
        return customRigModel.CustomRigModel()

    @property
    def _view2ModelMsg(self):
        return {'expose_ankle_attribute': 'expose_ankle_attribute',
                'expose_foot_attribute': 'expose_foot_attribute',
                'display_femur_limitation': 'display_femur_limitation',
                'link_rotator_ctl': 'link_rotator_ctl'}

    @property
    def _model2ViewMsg(self):
        return {'log': 'log'}

    def run(self, **kwargs):
        self._view = self._viewInstance
        self._view.setController(self)
        self._view.lateInit()

        self._model = self._modelInstance
        self._model.setController(self)
        self._model.lateInit()

        self._view.show()
