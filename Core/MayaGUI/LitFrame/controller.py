#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/4/13
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : controller.py


from Common.Scripts.singleton import Singleton
from Common.Functions.implement import abstract


class Controller(Singleton):
    _view = None
    _model = None

    def sendMessage(self, sender, msg, *args):
        if sender == self._view:
            if msg in self._view2ModelMsg:
                method = self._view2ModelMsg[msg]
                func = getattr(self._model, method)
                if not func:
                    print 'model has no method "%s"' % method
                else:
                    return func(*args)
            else:
                print '"%s" can\'t be found in view2ModelMsg' % msg
        elif sender == self._model:
            if msg in self._model2ViewMsg:
                method = self._model2ViewMsg[msg]
                func = getattr(self._view, method)
                if not func:
                    print 'view has no method "%s"' % method
                else:
                    return func(*args)
            else:
                print '"%s" can\'t be found in model2ViewMsg' % msg
        else:
            print 'sendMessage "%s" is error!' % msg
            print 'self: ', self
            print 'model: ', self._model
            print 'view: ', self._view

    @property
    def _model2ViewMsg(self): abstract()

    @property
    def _view2ModelMsg(self): abstract()

    @property
    def _viewInstance(self): abstract()

    @property
    def _modelInstance(self): abstract()

    def run(self, **kwargs):
        self._view = self._viewInstance
        self._view.setController(self)
        self._view.lateInit()

        self._model = self._modelInstance
        self._model.setController(self)
        self._model.lateInit()

        self._view.show()
