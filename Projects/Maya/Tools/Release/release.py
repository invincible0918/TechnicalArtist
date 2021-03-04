#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/04/16
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : release.py


import os
import hashlib
import shutil
import py_compile


SOURCEPATH = r'E:\Projects\TA'
DESTPATH = r'\\ubisoft.org\blue\SHA\Animation\TA'
FORCECOMPILE = False
FILTERFOLDERS = ['PVZ', 'MotionBuilder']


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

            isFilter = False
            for filterStr in FILTERFOLDERS:
                if '\\' + filterStr + '\\' in sourcePath:
                    isFilter = True
                    break

            if isFilter:
                continue

            destPath = sourcePath.replace(SOURCEPATH, DESTPATH)

            needCopy = True
            if FORCECOMPILE:
                if sourcePath.endswith('.py'):
                    # need to compile to pyc file then copy it
                    try:
                        py_compile.compile(sourcePath)
                        destPath += 'c'
                    except Exception as e:
                        print '\t Can not compile "%s"' % sourcePath
                        needCopy = False
            else:
                if sourcePath.endswith('.py'):
                    pycFile = sourcePath.rsplit('.')[0] + '.pyc'

                    if os.path.exists(pycFile):
                        needCopy = False

            # if needCopy:
            dirName = os.path.dirname(destPath)
            if not os.path.exists(dirName):
                os.makedirs(dirName)

            if not isHashEqual(sourcePath, destPath):
                print 'Copy from \n\t%s\n to \n\t%s\n' % (sourcePath, destPath)

                if os.path.exists(destPath):
                    # 0777 removes the read-only property of files on my system
                    os.chmod(destPath, 0777)
                shutil.copyfile(sourcePath, destPath)
