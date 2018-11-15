#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/04/16
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : release.py


import os
import hashlib
import shutil
import py_compile


SOURCEPATH = r'F:\Projects\PVZCommando\ArtDev\TA'
DESTPATH = r'\\eamc-sha-fs01.eamobile.ad.ea.com\Shares\Public\TA'
FORCECOMPILE = False


def getHash(file):
    f = open(file, 'rb')
    line = f.readline()
    hash = hashlib.md5()

    while line:
        hash.update(line)
        line = f.readline()
    f.close()
    return hash.hexdigest()


def isHashEqual(f1, f2):
    if not os.path.exists(f1) or not os.path.exists(f2):
        return False
    str1 = getHash(f1)
    str2 = getHash(f2)
    return str1 == str2

if __name__ == '__main__':
    combinedFiles = []
    for root, ds, fs in os.walk(SOURCEPATH):
        for f in fs:
            sourcePath = os.path.join(root, f)
            destPath = sourcePath.replace(SOURCEPATH, DESTPATH)

            needCopy = True
            if FORCECOMPILE:
                if sourcePath.endswith('.py'):
                    # need to compile to pyc file then copy it
                    py_compile.compile(sourcePath)
                    destPath += 'c'
            else:
                if sourcePath.endswith('.py'):
                    pycFile = sourcePath.rsplit('.')[0] + '.pyc'

                    if os.path.exists(pycFile):
                        needCopy = False

            if needCopy:
                dirName = os.path.dirname(destPath)
                if not os.path.exists(dirName):
                    os.makedirs(dirName)

                if not isHashEqual(sourcePath, destPath):
                    print 'Copy from \n\t%s\n to \n\t%s\n' % (sourcePath, destPath)
                    shutil.copyfile(sourcePath, destPath)
