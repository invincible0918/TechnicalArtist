#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/2/8
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : YamlIO.py

import yaml


def read(filePath):
    with open(filePath) as f:
        return yaml.load(f)


def write(filePath, data):
    """
    :param filePath:
    :param data: dict
    :return:
    """
    with open(filePath, 'w') as outfile:
        yaml.dump(data, outfile, default_flow_style=False)
