#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/2/23
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : loadMayaMenu.py

import os


# it should be run after maya startup
def loadMenus(projects):
    menus = []

    # load common menu
    commonMenuDir = os.path.join(os.environ['TATOOL'], r'Common\MayaScripts\Menus')
    if os.path.exists(commonMenuDir):
        menus.append(commonMenuDir)

    # load every project's menu
    for project in projects:
        # if user maya/scripts/config.cfg doesn't include this project
        # then don't import it
        projectDir = os.path.basename(project)

        if projectDir not in os.environ['PROJECTS']:
            continue
        try:
            menuDir = os.path.join(project, r'MayaScripts/Menus')
            if os.path.exists(menuDir):
                menus.append(menuDir)

        except Exception, e:
            print Exception, ':', e

    return menus
