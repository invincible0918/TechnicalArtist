#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/2/15
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : buildEnvironment.py


import sys
import os
import subprocess
import socket
from functools import partial


def __getMayaPath():
    from distutils.sysconfig import get_python_lib
    """
    C:\Program Files\Autodesk\Maya2015\Python\Lib\site-packages
    :return: str
    """
    return get_python_lib()


def __getNativePythonPath(pythonPath):
    return os.path.join(pythonPath, r'Lib\site-packages')


def __extendEnvironment(data):
    for k, v in data.items():
        if k == 'PYTHONPATH':
            path = os.path.join(v, r'Lib\site-packages')
            if 'PYTHONPATH' not in os.environ:
                os.environ['PYTHONPATH'] = path
            else:
                os.environ['PYTHONPATH'] = os.environ['PYTHONPATH'] + ';' + path
            os.environ['LOCALPYTHON'] = v
        else:
            os.environ[k] = str(v)


def __buildPath():
    # build native Python environment
    pythonLib = os.path.join(os.environ['LOCALPYTHON'], r'Lib\site-packages')
    if pythonLib not in sys.path:
        sys.path.append(pythonLib)

    taPath = os.environ['TATOOL']
    corePath = os.path.join(taPath, 'Core')

    if taPath not in sys.path:
        sys.path.append(taPath)

    if corePath not in sys.path:
        sys.path.append(corePath)

    projectRoot = os.path.join(taPath, 'Projects')
    projects = [os.path.join(projectRoot, path) for path in os.listdir(projectRoot)]
    return projects


def __buildLib(data):
    taPath = data['TATOOL']
    installer = os.path.join(taPath, 'Installer')

    configPath = os.path.join(os.path.split(__file__)[0], 'installMotionBuilderPackage.cfg')
    with open(configPath) as f:
        d = f.read()
        d = d.replace('\r', '\n')
        localLIBs = ["\"" + os.path.join(installer, lib) + "\"" for lib in d.split('\n') if lib != '']

    py = os.path.join(data['PYTHONPATH'],  r'Scripts\pip.exe')
    cmd = '"%s" install %s' % (py, ' '.join(localLIBs))
    cmd = cmd.replace('\\', '/')
    print cmd
    s = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
    for i in iter(s.stdout.readline, b''):
        print i.rstrip()
    return s.communicate()


def __onSceneOpened(*args):
    # do something after maya opened

    # load menu and shelves
    # menus = args[0]
    # shelves = args[1]
    # initScripts = args[2]
    # __initializeFunctions(menus, shelves, initScripts)

    # create command port
    __createCommandPort()


# def __initializeFunctions(menus, shelves, initScripts):
#     p = os.path.join(os.environ['TATOOL'], r'Common\Tools\ImportModule')
#     if p not in sys.path:
#         sys.path.append(p)
#
#     # should I always use reload?
#     import load
#
#     def loadScript(paths):
#         for path in paths:
#             scripts = list(set([script.split('.')[0] for script in os.listdir(path)]))
#             for script in scripts:
#
#                 # don't need to load this file
#                 if script == '__init__':
#                     continue
#
#                 scriptPath = os.path.join(path, script)
#                 load.load(script, scriptPath)
#
#     loadScript(menus)
#     loadScript(shelves)
#     loadScript(initScripts)


def __createCommandPort():
    ip = socket.gethostbyname(socket.gethostname())
    port = 4242
    addr = '%s:%s' % (ip, port)

    if port:
        print '\n\tCommandPort %s Opened!\n' % addr
    else:
        print '\n\tCommandPort %s Closed!\n' % addr


def build(data):
    #  build environment
    __extendEnvironment(data)

    # build TA environment
    projects = __buildPath()

    # build lib, it's blocked
    stdout, stderr = __buildLib(data)
    if stdout:
        print 'OUT'
        stdout = stdout.replace('\r', '\n')
        for log in stdout.split('\n'):
            print log

    if stderr:
        print 'ERR'
        stderr = stderr.replace('\r', '\n')
        for err in stderr.split('\n'):
            print err

    # # build every single project's environment
    # import loadMayaMenu
    # menus = loadMayaMenu.loadMenus(projects)
    #
    # # build every single project's environment
    # import loadMayaShelves
    # shelves = loadMayaShelves.loadShelves(projects)
    #
    # # build init project functions
    # import initScripts
    # initScripts = initScripts.initScripts(projects)
    #
    # # bind event callback
    # import maya.cmds as mc
    # mc.scriptJob(runOnce=True, event=['SceneOpened', partial(__onSceneOpened, menus, shelves, initScripts)])
    __onSceneOpened()


def buildStandalone(data, callback):
    # build environment
    __extendEnvironment(data)

    # build TA environment
    __buildPath()

    # build lib, it's blocked
    stdout, stderr = __buildLib(data)
    if stdout:
        print 'OUT'
        stdout = stdout.replace('\r', '\n')
        for log in stdout.split('\n'):
            print log

    if stderr:
        print 'ERR'
        stderr = stderr.replace('\r', '\n')
        for err in stderr.split('\n'):
            print err

    callback()


