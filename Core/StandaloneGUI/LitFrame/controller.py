#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/4/13
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : controller.py


from Common.Scripts.singleton import Singleton
from Common.Functions.implement import abstract
from PySide import QtGui
import sys


class Controller(Singleton):
    __view = None
    __model = None

    def sendMessage(self, sender, msg, *args):
        if sender == self.__view:
            if msg in self._view2ModelMsg:
                method = self._view2ModelMsg[msg]
                func = getattr(self.__model, method)
                if not func:
                    print 'model has no method "%s"' % method
                else:
                    return func(*args)
            else:
                print '"%s" can\'t be found in view2ModelMsg' % msg
        elif sender == self.__model:
            if msg in self._model2ViewMsg:
                method = self._model2ViewMsg[msg]
                func = getattr(self.__view, method)
                if not func:
                    print 'view has no method "%s"' % method
                else:
                    return func(*args)
            else:
                print '"%s" can\'t be found in model2ViewMsg' % msg
        else:
            print 'sendMessage "%s" is error!' % msg
            print 'self: ', self
            print 'model: ', self.__model
            print 'view: ', self.__view

    @property
    def _model2ViewMsg(self): abstract()

    @property
    def _view2ModelMsg(self): abstract()

    @property
    def _viewInstance(self): abstract()

    @property
    def _modelInstance(self): abstract()

    def run(self):
        app = QtGui.QApplication(sys.argv)
        self.__view = self._viewInstance
        self.__view.setController(self)
        self.__view.lateInit()

        self.__model = self._modelInstance
        self.__model.setController(self)
        self.__model.lateInit()

        self.__view.show()

        app.aboutToQuit.connect(self.__view.quitHandler)
        sys.exit(app.exec_())
