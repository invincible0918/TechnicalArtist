#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/2/15
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : buildEnvironment.py


import sys
import os
import subprocess
import maya.cmds as mc
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
            os.environ['PYTHONPATH'] = os.environ['PYTHONPATH'] + ';' + path
            os.environ['LOCALPYTHON'] = v
        else:
            os.environ[k] = str(v)


def __buildPath():
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

    configPath = os.path.join(os.path.split(__file__)[0], 'installPackage.cfg')
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
    menus = args[0]
    shelves = args[1]
    initScripts = args[2]
    __initializeFunctions(menus, shelves, initScripts)

    # create command port
    __createCommandPort()


def __initializeFunctions(menus, shelves, initScripts):
    p = os.path.join(os.environ['TATOOL'], r'Common\Tools\ImportModule')
    if p not in sys.path:
        sys.path.append(p)

    import load

    def loadScript(paths):
        for path in paths:
            scripts = list(set([script.split('.')[0] for script in os.listdir(path)]))
            for script in scripts:
                scriptPath = os.path.join(path, script)
                load.load(script, scriptPath)

    loadScript(menus)
    loadScript(shelves)
    loadScript(initScripts)


def __createCommandPort():
    ip = socket.gethostbyname(socket.gethostname())
    port = 6000
    addr = '%s:%s' % (ip, port)

    # Close ports if they were already open under another configuration
    try:
        mc.commandPort(n=addr, close=True)
    except:
        mc.warning('Could not close port %s (maybe it is not opened yet...)' % port)

    mc.commandPort(n=addr, sourceType='python')
    port = mc.commandPort(addr, q=True)

    if port:
        print '\n\tCommandPort %s Opened!\n' % addr
    else:
        print '\n\tCommandPort %s Closed!\n' % addr


def build(data):
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

    #  build environment
    __extendEnvironment(data)

    # build native Python environment
    pythonLib = os.path.join(data['PYTHONPATH'], r'Lib\site-packages')
    if pythonLib not in sys.path:
        sys.path.append(pythonLib)

    # build TA environment
    projects = __buildPath()

    # build every single project's environment
    import loadMayaMenu
    menus = loadMayaMenu.loadMenus(projects)

    # build every single project's environment
    import loadMayaShelves
    shelves = loadMayaShelves.loadShelves(projects)

    # build init project functions
    import initScripts
    initScripts = initScripts.initScripts(projects)

    # bind event callback
    mc.scriptJob(runOnce=True, event=['SceneOpened', partial(__onSceneOpened, menus, shelves, initScripts)])
