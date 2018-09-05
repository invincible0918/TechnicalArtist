#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 4/18/2018
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : main.py


import os
import sys


def getDirs(dirName):
    dirPaths = [dirPath for dirPath in sys.path if 'maya' in dirPath.lower()
                and 'users' in dirPath.lower()
                and dirPath.endswith('scripts')]

    dirs = []
    for dirPath in dirPaths:
        fullPath = os.path.join(dirPath, dirName)
        if os.path.exists(fullPath):
            dirs.append(fullPath)

    return dirs


def getFile(fileName):
    dirPaths = [dirPath for dirPath in sys.path if 'maya' in dirPath.lower()
                and 'users' in dirPath.lower()
                and dirPath.endswith('scripts')]

    fullPath = ''
    for dirPath in dirPaths:
        _fullPath = os.path.join(dirPath, fileName)
        if os.path.exists(_fullPath):
            fullPath = _fullPath
            break

    if not fullPath:
        fullPath = os.path.join(dirPaths[0], fileName)
        dirName = os.path.dirname(fullPath)
        if not os.path.exists(dirName):
            os.makedirs(dirName)

    return fullPath

