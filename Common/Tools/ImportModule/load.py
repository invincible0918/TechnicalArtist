#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 4/16/2018
# @Company : INVINCIBLE STUDIO
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
    pyFile = modulePath + '.py'
    if os.path.exists(pyFile):
        try:
            imp.load_source(moduleName, pyFile)
            print '\tLoad module %s at %s successfully' % (moduleName, pyFile)
        except Exception as e:
            print '\tError: %s, Failed to load module %s at %s ...' % (e, moduleName, pyFile)
            print '\t...'
            traceback.print_exc()
    else:
        pycFile = modulePath + '.pyc'
        try:
            imp.load_compiled(moduleName, pycFile)
            print '\tLoad compiled module %s at %s successfully' % (moduleName, pycFile)
        except Exception as e:
            print '\tError: %s,Failed to load compiled module %s at %s ...' % (e, moduleName, pycFile)
            print '\t...'
            traceback.print_exc()

# if __name__ == '__main__':
#     load('__init__', r'F:\Projects\PVZCommando\ArtDev\TA\Common\MayaScripts\Menus\__init__')
    # load('commonMenu', r'F:\Projects\PVZCommando\ArtDev\TA\Common\MayaScripts\Menus\commonMenu')

