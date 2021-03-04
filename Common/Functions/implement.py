#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/4/13
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : implement.py

import inspect


def abstract():
    # caller = inspect.getouterframes(inspect.currentframe())[1][3]
    for trace in inspect.getouterframes(inspect.currentframe()):
        print trace
    raise NotImplementedError('must be implemented in subclass')


class classproperty(object):
    def __init__(self, f):
        self.f = f

    def __get__(self, obj, owner):
        return self.f(owner)
