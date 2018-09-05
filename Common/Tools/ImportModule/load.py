#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 4/16/2018
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : load.py


import imp
import os
import traceback


def load(moduleName, modulePath):
    """
    :param moduleName:
    :param modulePath: no need to add post fix
    :param source:
    :return:
    """
    modulePath = os.path.splitext(modulePath)[0]
    try:
        imp.load_source(moduleName, modulePath + '.py')
        print '\tLoad module %s at %s successfully' % (moduleName, modulePath + '.py')
    except Exception as e:
        print '\tError: %s, Failed to load module %s at %s ...' % (e, moduleName, modulePath + '.py')
        print '\t...'
        traceback.print_exc()
        print '\tLoad compiled module %s at %s' % (moduleName, modulePath + '.pyc')
        try:
            imp.load_compiled(moduleName, modulePath + '.pyc')
            print '\tLoad module %s at %s successfully' % (moduleName, modulePath + '.pyc')
        except Exception as e:
            print '\tError: %s,Failed to load module %s at %s ...' % (e, moduleName, modulePath + '.pyc')
            traceback.print_exc()
