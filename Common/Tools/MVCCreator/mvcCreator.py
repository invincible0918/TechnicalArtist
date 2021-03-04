#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/8/24
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : mvcCreator.py


import os
import shutil
import datetime


TEMPLATEDICT = {'ProjectName': 'ProjectName',
                'template': 'template',
                'Template': 'Template'}


def getToolNames(projectName):
    scriptPath = os.path.realpath(__file__)
    toolDir = os.path.join(scriptPath.split(r'\Common')[0], r'Projects\%s\Tools' % projectName)

    toolNames = []
    for root, dirs, files in os.walk(toolDir):
        toolNames = dirs
        break

    return toolNames


def getProjectNames():
    scriptPath = os.path.realpath(__file__)
    rootPath = os.path.join(scriptPath.split(r'\Common')[0], r'Projects')

    projectNames = []
    for root, dirs, files in os.walk(rootPath):
        projectNames = dirs
        break

    return projectNames


def create(projectName, toolName, ToolName):
    TEMPLATEDICT['ProjectName'] = projectName
    TEMPLATEDICT['template'] = toolName
    TEMPLATEDICT['Template'] = ToolName

    scriptPath = os.path.realpath(__file__)
    sourceDir = os.path.join(os.path.dirname(scriptPath), 'Template')
    destDir = os.path.join(scriptPath.split(r'\Common')[0], r'Projects\%s\Tools\%s' % (projectName, ToolName))

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

                # 0777 removes the read-only property of files on my system
                os.chmod(newName, 0777)
                with open(newName, 'r+') as f:
                    data = f.read().replace('YYYY/MM/DD', todayFmt)
                    for k, v in TEMPLATEDICT.items():
                        data = data.replace(k, v)
                    # data = f.read().replace('template', toolName).replace('Template', ToolName).replace('YYYY/MM/DD', todayFmt)
                    f.seek(0)
                    f.write(data)
                    f.truncate()


if __name__ == '__main__':
    inputString = raw_input('Input the project name and module name like this {proj/module}, the first character of module name should be lower case: ')
    if inputString:
        tmp = inputString.split('/')
        projectName = tmp[0]
        toolName = tmp[1]
        ToolName = toolName[0].upper() + ''.join(toolName[1:])

        projectNames = getProjectNames()
        toolNames = getToolNames(projectName)

        if (projectName in projectNames) and (toolName not in toolNames):
            create(projectName, toolName, ToolName)

