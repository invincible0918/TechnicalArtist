#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 5/9/2018
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : initPackages.py


import os
import sys
from maya import cmds as mc


def __init_project():
    pass


def __register_events():
    p = os.path.join(os.environ['TATOOL'], r'Common\Tools\ImportModule')
    if p not in sys.path:
        sys.path.append(p)

    import load

    project_path = '%s/../../Tools/' % os.path.dirname(os.path.realpath(__file__))
    for path in os.listdir(project_path):
        register_event_script_path = '%s/%s/Package/Scripts/registerEvents' % (project_path, path)
        if os.path.exists(register_event_script_path + '.py') or os.path.exists(register_event_script_path + '.pyc'):
            load.load('register_events', register_event_script_path)


def __update_manually():
    p = os.path.join(os.environ['TATOOL'], r'Common\Tools\ImportModule')
    if p not in sys.path:
        sys.path.append(p)

    # import load
    #
    # project_path = '%s/../../Tools/' % os.path.dirname(os.path.realpath(__file__))
    # for path in os.listdir(project_path):
    #     script_path = '%s/%s/Package/Scripts/updateManually' % (project_path, path)
    #     if os.path.exists(script_path + '.py') or os.path.exists(script_path + '.pyc'):
    #         load.load('update_manually', script_path)


def __load_plugins():
    __load_plugin('mathSpring', r'Projects\Blue\Tools\MathUtilities\regisiter.py')


def __load_plugin(plugin_name, init_script_path):
    if not mc.pluginInfo(plugin_name, q=True, loaded=True):
        plugin_path = os.path.join(os.environ['TATOOL'], init_script_path).replace('\\', '/')
        mc.loadPlugin(plugin_path)
        mc.pluginInfo(plugin_path, e=True, autoload=True)
    else:
        mc.unloadPlugin(plugin_name, f=True)


def init_scripts():
    __init_project()
    __register_events()
    __update_manually()
    __load_plugins()


init_scripts()
