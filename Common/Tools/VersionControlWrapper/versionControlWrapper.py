#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/11/22
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : versionControlWrapper.py


import os
import sys

relativePath = os.path.dirname(__file__) + '/..'
if relativePath not in sys.path:
    sys.path.append(relativePath)


from P4Wrapper import p4Wrapper
from SVNWrapper import svnWrapper
from Arguement import arguement
from InvokeScript import invokeScript


WRAPPER = {'P4': p4Wrapper,
           'SVN': svnWrapper}


DEFAULTWRAPPER = 'P4'


class VersionControlWrapper(object):
    def __init__(self, **kwargs):
        self.__wrapper = WRAPPER[DEFAULTWRAPPER].Creator(**kwargs)

    def commit(self):
        self.__wrapper.commit()

    def delete(self):
        self.__wrapper.delete()

    def getInfo(self):
        return self.__wrapper.getInfo()


def commit(**kwargs):
    wrapper = VersionControlWrapper(**kwargs)
    wrapper.commit()


def delete(**kwargs):
    wrapper = VersionControlWrapper(**kwargs)
    wrapper.delete()


def getInfo(**kwargs):
    wrapper = VersionControlWrapper(**kwargs)
    return wrapper.getInfo()


FUNCTIONDICT = {'commit': commit,
                'delete': delete,
                'getInfo': getInfo}


def main(args):
    arguementDict = arguement.processArguement(args)

    result = ''
    for k, v in arguementDict.items():
        if k in FUNCTIONDICT:
            result = FUNCTIONDICT[k](**arguementDict)
            break

    print '%s:%s' % (invokeScript.OUTPUTSTREAMRESULT, result)

main(sys.argv[1:])
