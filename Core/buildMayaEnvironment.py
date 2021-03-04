#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/2/15
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : buildEnvironment.py


import sys
import os
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


def __initializeFunctions(menus, shelves, initScripts):
    p = os.path.join(os.environ['TATOOL'], r'Common\Tools\ImportModule')
    if p not in sys.path:
        sys.path.append(p)

    # should I always use reload?
    import load

    def loadScript(paths):
        for path in paths:
            scripts = list(set([script.split('.')[0] for script in os.listdir(path)]))
            for script in scripts:

                # don't need to load this file
                if script == '__init__':
                    continue

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
    import maya.cmds as mc
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


def __deferBuild(data):
    p = os.path.join(data['TATOOL'], r'Core')
    if p not in sys.path:
        sys.path.append(p)
    import installPackages
    print """
    ##############################################
    ###########  Scene Opened Event ##############
    ##############################################
    """

    #  the 1st thing & the most important thing to do is building environment
    __extendEnvironment(data)

    # build TA environment
    projects = __buildPath()

    # build lib, it's blocked
    stdout, stderr = installPackages.install(data['PYTHONPATH'], data['TATOOL'])
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

    # build every single project's environment
    import loadMayaMenu
    menus = loadMayaMenu.loadMenus(projects)

    # build every single project's environment
    import loadMayaShelves
    shelves = loadMayaShelves.loadShelves(projects)

    # build init project functions
    import initScripts
    initScripts = initScripts.initScripts(projects)

    # load menu and shelves
    __initializeFunctions(menus, shelves, initScripts)

    # create command port
    __createCommandPort()


def redirect_ta_path(data):
    from shared.MSVLib.msvTools import msvP4
    projectroot = msvP4.get_root()
    ta_path = os.path.join(projectroot, r'tools\dcc\blue\externalExecutables\TA')
    data['TATOOL'] = ta_path


def check_tool_date(data):
    from shared.MSVLib.msvTools import msvP4
    # from Core.MayaGUI import dialog

    ta_path = data['TATOOL']
    # msvP4.get_latest_files([ta_path])

    # mute this process as it spends too much time
    # for root, ds, fs in os.walk(ta_path):
    #     for f in fs:
    #         file_path = os.path.join(root, f)
    #         remote_files = msvP4.get_remote_files(file_path)
    #         all_stats = msvP4.get_files_stats(remote_files)
    #
    #         for f_stat in all_stats:
    #             have_rev = f_stat.get('haveRev')
    #             head_rev = f_stat.get('headRev')
    #
    #             if have_rev != head_rev:
    #                 message = 'This rig file is not the latest one! Please update!'
    #                 gui = dialog.ConfirmDialog2(**{'message': message})
    #                 gui.show()
    #                 return


def build(data):
    redirect_ta_path(data)
    # check_tool_date(data)

    import maya.cmds as mc
    mc.scriptJob(runOnce=True, event=['SceneOpened', partial(__deferBuild, data)])
    print '#' * 50
    print 'Defer Build is done!'
    print '#' * 50
    # import Common.Functions.customMayaEvent as customMayaEvent
    # reload(customMayaEvent)
    # customMayaEvent.SceneOpened(partial(__deferBuild, data), False)


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


