#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 1/16/2018
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : jsonIO.py


import json


class JsonRead(object):
    def __init__(self, path):
        with open(path, 'r') as f:
            self.__data = json.load(f)

    @property
    def data(self):
        return self.__data


class JsonWrite(object):
    def __init__(self, data, path):
        with open(path, 'w') as f:
            json.dump(data, f)
