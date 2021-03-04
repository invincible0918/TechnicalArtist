#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/05/09
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
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
