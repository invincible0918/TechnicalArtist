#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 1/18/2019
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : pyqtThread.py


from PySide.QtCore import *


class PyqtThread(QThread):
    MySignal = Signal(object)

    def __init__(self, *args, **kwargs):
        super(PyqtThread, self).__init__()
        self.__args = args
        self.__kwargs = kwargs

    def __del__(self):
        self.wait()

    def run(self):
        self.MySignal.emit(self.__args)


def run(func, *args, **kwargs):
    t = PyqtThread(*args, **kwargs)
    t.MySignal.connect(func, Qt.QueuedConnection)
    t.start()



