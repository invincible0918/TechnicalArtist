#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/05/09
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : animalToTaliskerController.py


from Core.MayaGUI.LitFrame.controller import Controller


class AnimalToTaliskerController(Controller):
    @property
    def _viewInstance(self):
        import animalToTaliskerView
        return animalToTaliskerView.AnimalToTaliskerView()

    @property
    def _modelInstance(self):
        import animalToTaliskerModel
        return animalToTaliskerModel.AnimalToTaliskerModel()

    @property
    def _view2ModelMsg(self):
        return {}

    @property
    def _model2ViewMsg(self):
        return {}
