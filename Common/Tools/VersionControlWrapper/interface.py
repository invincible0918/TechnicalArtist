#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/11/22
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : main.py


import os
import sys

relativePath = os.path.dirname(__file__) + '/../InvokeScript'
if relativePath not in sys.path:
    sys.path.append(relativePath)


import invokeScript


def __parseCommand(args):
    script = os.path.join(os.environ['TATOOL'], r'Common\Tools\VersionControlWrapper\versionControlWrapper.py')
    localPython = os.path.join(os.environ['LOCALPYTHON'], 'python.exe')

    cmd = '%s %s %s' % (localPython, script, args)
    cmd = cmd.replace('\\', '/')
    print '\n\tinterface: %s\n' % cmd

    return invokeScript.run(cmd)


def parseArgs(**kwargs):
    args = ''
    for k, v in kwargs.items():
        args += '--%s %s' % (k, v)
    return __parseCommand(args)

