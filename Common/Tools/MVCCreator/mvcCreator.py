#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/8/24
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : mvcCreator.py


import os
import shutil
import datetime


PROJECTNAME = 'PVZ'


def getToolNames():
    scriptPath = os.path.realpath(__file__)
    toolDir = os.path.join(scriptPath.split(r'\Common')[0], r'Projects\%s\Tools' % PROJECTNAME)

    toolNames = []
    for root, dirs, files in os.walk(toolDir):
        toolNames = dirs
        break

    return toolNames


def create(toolName, ToolName):
    scriptPath = os.path.realpath(__file__)
    sourceDir = os.path.join(os.path.dirname(scriptPath), 'Template')
    destDir = os.path.join(scriptPath.split(r'\Common')[0], r'Projects\%s\Tools\%s' % (PROJECTNAME, ToolName))

    os.makedirs(destDir)

    today = datetime.date.today()
    todayFmt = today.strftime('%Y/%m/%d')

    for root, dirs, files in os.walk(sourceDir):
        for file in files:
            fullPath = os.path.join(root, file)

            dest = destDir + fullPath.split(sourceDir)[-1]

            tmpDir = os.path.dirname(dest)
            if not os.path.exists(tmpDir):
                os.makedirs(tmpDir)

            shutil.copy2(fullPath, dest)

            if file.endswith('.py'):
                if 'template' in dest:
                    newName = dest.replace('template', toolName)
                    os.rename(dest, newName)
                else:
                    newName = dest

                with open(newName, 'r+') as f:
                    data = f.read().replace('template', toolName).replace('Template', ToolName).replace('YYYY/MM/DD', todayFmt)
                    f.seek(0)
                    f.write(data)
                    f.truncate()


if __name__ == '__main__':
    toolName = raw_input('Input the module name, the first character should be lower case: ')
    if toolName:
        ToolName = toolName[0].upper() + ''.join(toolName[1:])

        toolNames = getToolNames()
        if toolName not in toolNames:
            create(toolName, ToolName)

