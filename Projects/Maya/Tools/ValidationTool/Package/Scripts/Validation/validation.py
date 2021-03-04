#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 7/11/2018
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : validation.


from abc import ABCMeta, abstractmethod


class Validation(object):
    __metaclass__ = ABCMeta

    def __init__(self):
        pass

    @abstractmethod
    def validation(self):
        pass