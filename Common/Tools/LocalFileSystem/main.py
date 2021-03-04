#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 4/18/2018
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : main.py


import os
import sys
import ctypes
from ctypes.wintypes import MAX_PATH


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


# def getStandaloneDirs(dirName):
#     dirPaths = [dirPath for dirPath in sys.path if 'maya' in dirPath.lower()
#                 and 'users' in dirPath.lower()
#                 and dirPath.endswith('scripts')]
#
#     dirs = []
#     for dirPath in dirPaths:
#         fullPath = os.path.join(dirPath, dirName)
#         if os.path.exists(fullPath):
#             dirs.append(fullPath)
#
#     return dirs


def getStandaloneFile(fileName):
    dll = ctypes.windll.shell32
    buf = ctypes.create_unicode_buffer(MAX_PATH + 1)
    if dll.SHGetSpecialFolderPathW(None, buf, 0x0005, False):
        fullPath = os.path.join(buf.value, fileName)

        if not os.path.exists(fullPath):
            dirName = os.path.dirname(fullPath)
            if not os.path.exists(dirName):
                os.makedirs(dirName)

        return fullPath
    else:
        print("Failure!")
        return ''



