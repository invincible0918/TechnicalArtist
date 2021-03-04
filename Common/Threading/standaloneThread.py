#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 1/18/2019
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : standaloneThread.py


import threading


class StandaloneThread(threading.Thread):
    def __init__(self, func, *args, **kwargs):
        super(StandaloneThread, self).__init__()
        self.__func = func
        self.__args = args
        self.__kwargs = kwargs

    def run(self):
        self.__func(*self.__args, **self.__kwargs)


def run(func, *args, **kwargs):
    thread = StandaloneThread(func, *args, **kwargs)
    thread.setName('thread ' + str(func))
    thread.start()
