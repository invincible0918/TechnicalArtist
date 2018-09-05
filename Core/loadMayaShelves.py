#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/2/23
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : loadMayaMenu.py

import os


# it should be run after maya startup
def loadShelves(projects):
    shelves = []

    # load common menu
    commonShelfDir = os.path.join(os.environ['TATOOL'], r'Common\MayaScripts\Shelves')
    if os.path.exists(commonShelfDir):
        shelves.append(commonShelfDir)

    # load every project's menu
    for project in projects:
        # if user maya/scripts/config.cfg doesn't include this project
        # then don't import it
        projectDir = os.path.basename(project)
        if projectDir not in os.environ['PROJECTS']:
            continue
        try:
            shelfDir = os.path.join(project, r'MayaScripts/Shelves')
            if os.path.exists(shelfDir):
                shelves.append(shelfDir)

        except Exception, e:
            print Exception, ':', e

    return shelves
