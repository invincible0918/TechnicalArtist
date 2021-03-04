#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/2/9
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : commonFunction.py

import os
import stat
import shutil
import hashlib


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


def msgBox(msg):
    ####################################################################################################
    #
    # msg
    #
    ####################################################################################################
    print '#' * 100
    print '#\n#\t %s\n#' % msg
    print '#' * 100


def createFolder(dir):
    if not os.path.exists(dir):
        os.makedirs(dir)
        msgBox('create dir %s' % dir)


# copy a whole dir textures 2 another dir
def cpByDir(sourceDir, destDir, ext=None, force=False):
    print 'sourceDir: %s' % sourceDir
    print 'destDir: %s' % destDir

    res = []
    w = os.walk(sourceDir)
    for root, dirs, files in w:
        for file in files:
            if ext and file.split('.')[-1] == ext or ext is None:
                source = os.path.join(root, file)
                dest = source.replace('\\', '/').replace(sourceDir.replace('\\', '/'), destDir.replace('\\', '/'))
                if not os.path.exists(os.path.dirname(dest)):
                    os.makedirs(os.path.dirname(dest))

                if not isHashEqual(source, dest) or force:
                    if os.path.exists(dest):
                        # 0777 removes the read-only property of files on my system
                        os.chmod(dest, 0777)
                    shutil.copy(source, dest)
                    print 'Copy from "%s" to "%s"' % (source, dest)
                    res.append(os.path.join(destDir, file))
    return res


def cpByFile(file, destDir, ext=None):
    if ext and os.path.splitext(file) == ('.' + ext) or ext is None:
        if os.path.exists(destDir):
            fileAttr = os.stat(destDir)[0]
            if not fileAttr & stat.S_IWRITE:
                # File is read-only, so make it writeable
                os.chmod(destDir, stat.S_IWRITE)
        shutil.copy(file, destDir)
    return os.path.join(destDir, os.path.basename(file))


def cpByFiles(files, destDir, ext=None):
    for file in files:
        cpByFile(file, destDir, ext)


def export2DAE(rootName, fullPathName, options):
    try:
        from maya import cmds as mc
        mc.select(rootName, r=True)
        mc.file(fullPathName,
                force=True,
                options=options,
                typ='COLLADA exporter',
                pr=True,
                es=True)
        mc.select(cl=True)
        return True
    except Exception as e:
        print '\tError Message: %s' % e.message
        return False


def findFiles(destDir, fileName):
    li = []
    for root, dirs, files in os.walk(destDir):
        for file in files:
            if fileName in file:
                li.append(os.path.join(root, file))
    return li


def __filterNode(obj, filterType):
    from maya import cmds as mc
    if filterType == 'emptyGroup':
        if mc.objectType(obj) == 'transform' and \
                        mc.listRelatives(obj, c=True) is None and \
                        mc.listRelatives(obj, s=True) is None:
            return True
    elif filterType == 'group':
        if mc.objectType(obj) == 'transform' and \
                        mc.listRelatives(obj, s=True) is None:
            return True
    else:
        if mc.objectType(obj) == filterType:
            return True

    return False


def getAllChildrenByType(node, li, type=None, includingParent=False):
    from maya import cmds as mc

    if includingParent and mc.objectType(node) == type:
        li.append(node)

    children = mc.listRelatives(node, c=True, f=True)
    if children:
        for child in children:
            getAllChildrenByType(child, li, type)

        if type:
            for obj in children:
                if mc.objectType(obj) == type:
                    li.append(obj)
        else:
            li.extend(children)


def getAllChildren(node, li, filterType=None, includingParent=False):
    """
    :param node:
    :param li:
    :param filterType:
                        group: a transform node without shape node
                        emptyGroup:  a transform node without children node
    :return:
    """
    from maya import cmds as mc

    if includingParent and __filterNode(node, filterType):
        li.append(node)

    children = mc.listRelatives(node, c=True, f=True)
    if children:
        for child in children:
            getAllChildren(child, li, filterType)

        if filterType:
            for obj in children:
                if __filterNode(obj, filterType):
                    li.append(obj)
        else:
            li.extend(children)


def getFullPathName(node):
    paths = []
    _getFullPathName(node, paths)
    paths.reverse()

    paths.append(node.split('|')[-1])
    return '|'.join(paths)


def _getFullPathName(node, paths):
    from maya import cmds as mc

    parents = mc.listRelatives(node, p=True, f=True)
    if parents:
        paths.append(parents[0].split('|')[-1])
        _getFullPathName(parents[0], paths)


