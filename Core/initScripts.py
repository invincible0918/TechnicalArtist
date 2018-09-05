#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 5/9/2018
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : initProjects.py


import os


# it should be run after maya startup
def initScripts(projects):
    scripts = []

    for project in projects:
        projectDir = os.path.basename(project)

        if projectDir not in os.environ['PROJECTS']:
            continue
        try:
            scriptPath = os.path.join(project, r'MayaScripts/InitScripts')
            if os.path.exists(scriptPath):
                scripts.append(scriptPath)

        except Exception, e:
            print Exception, ':', e

    return scripts