#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/11/22
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : main.py


import os
import sys

relativePath = os.path.dirname(__file__) + '/../InvokeScript'
if relativePath not in sys.path:
    sys.path.append(relativePath)


import invokeScript


def __parseCommand(**kwargs):
    args = ''
    for k, v in kwargs.items():
        args += '--%s %s' % (k, v)

    script = os.path.join(os.environ['TATOOL'], r'Common\Tools\VersionControlWrapper\versionControlWrapper.py')
    localPython = os.path.join(os.environ['LOCALPYTHON'], 'python.exe')

    cmd = '%s %s %s' % (localPython, script, args)
    # cmd = cmd.replace('\\', '/')
    print '\n\tinterface: %s\n' % cmd

    return cmd


def parseArgs(**kwargs):
    cmd = __parseCommand(**kwargs)
    return invokeScript.run(cmd)


def parseArgsWithCallback(callback, **kwargs):
    cmd = __parseCommand(**kwargs)
    return invokeScript.runStandalone(cmd, callback)


def run(cmd):
    return invokeScript.run(cmd)


def runStandalone(cmd, callback):
    return invokeScript.runStandalone(cmd, callback)

