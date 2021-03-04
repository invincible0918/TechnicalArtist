#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 12/13/2018
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : main.py

import os
import tempfile
# from tempfile import TemporaryFile
from shutil import copytree, rmtree

# f = TemporaryFile('w+t')
# # Use the temporary file
# # ...
# f.close()
# # File is destroyed

__TEMPFOLDERPATH = ''


def copy(source, callback):
    """
    :param source: copy this path into a temp folder
    :param callback: after copy operation finished, do something
    :return:
    """
    def remove(*args):
        print '\n\n\tEnd callback'
        rmtree(__TEMPFOLDERPATH)
        print '\n\n\tRemove temp folder'

    __TEMPFOLDERPATH = tempfile.mkdtemp()
    print '\n\n\tCreate temp folder at %s' % __TEMPFOLDERPATH
    dest = os.path.join(__TEMPFOLDERPATH, os.path.basename(source))
    copytree(source, dest)
    print '\n\n\tStart to invoke callback ...'
    callback(dest, remove)

    # rmtree(tmp)
    # print 'Remove temp folder'


