#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/3/10
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : commonMenu.py


import os
import sys
import stat
import time
from maya import cmds as mc
from maya import mel as mm


TOOLPATH = os.path.join(os.environ['TATOOL'], 'Common/Tools')
if TOOLPATH not in sys.path:
    sys.path.append(TOOLPATH)


COMMONMENU = ''


def __repairMayaTool(*args):
    from Common.Functions import commonFunction

    userSetup = os.path.join(os.environ['TATOOL'], 'Maya/userSetup.py')

    # update userSetup.py file
    for path in sys.path:
        if os.path.exists(path) and os.path.isdir(path):
            files = os.listdir(path)
            if files:
                if 'userSetup.py' in files and 'config.cfg' in files:
                    os.chmod(os.path.join(path, 'userSetup.py'), stat.S_IWRITE)
                    commonFunction.cpByFile(userSetup, path)
                    print '\n\tUpdate userSetup.py at %s' % path
                    break


def __renameMaterials(*args):
    from RenameMaterial import renameMaterial
    renameMaterial.RenameMaterial().do()


def __changeLocatorSize(*args):
    from ChangeLocatorSize import locatorOptions
    locatorOptions.LocatorOption().doItNow()


def __replaceNodeName(*args):
    from ReplaceNode import replaceNode
    replaceNode.run()


def __change2Meter(*args):
    from Change2Meter import change2Meter
    change2Meter.do()


def __showChangeLocatorSize(*args):
    from ChangeLocatorSize import locatorOptions
    for win in mc.lsUI(wnd=True):
        try:
            if mc.window(win, q=True, title=True) == 'Locator Options':
                mc.deleteUI(win, window=True)
        except:
            pass

    locatorOptions.LocatorOption().show()


def __updatePackages(*args):
    from UpdatePackages import updatePackages
    updatePackages.do()


def __relativePath(*args):
    from RelativePath import relativePath
    relativePath.run()


def countFiles(root):
    count = 0
    for root, dirs, files in os.walk(root):
        count += len(files)
    return count


def __afterInstall(*args):
    count = args[0]
    callback = args[1]

    dest = None
    for p in sys.path:
        if p.endswith('maya/scripts'):
            dest = os.path.join(p, 'animBot')

    # if user choose to install, it will go here
    if os.path.exists(dest):
        while True:
            _count = countFiles(dest.replace('\\', '/'))

            if count != _count:
                time.sleep(5)
            else:
                callback()
                break
    else:
        # if user doesn't choose to install, then invoke callback directly
        callback()


def __installAnimBot(*args):
    package_path = os.path.join(os.environ['TATOOL'], 'Common/ExternalTools/animBot/1.2.6/animBot')
    if package_path not in sys.path:
        sys.path.append(package_path)

    animbot_config = os.path.join(os.environ['TATOOL'], 'Common/ExternalTools/animBot/1.2.6/config.json').replace('\\', '/')
    if 'ANIMBOT_CONFIGJSONPATH' not in os.environ:
        os.environ['ANIMBOT_CONFIGJSONPATH'] = animbot_config

    from animBot._api.core import CORE as animbot_core
    animbot_core.trigger.animBotMenu_toggle()


def createMenu():
    mainWindow = mm.eval('$null = $gMainWindow')
    global COMMONMENU
    if mc.menu(COMMONMENU, q=True, exists=True):
        mc.deleteUI(COMMONMENU)

    COMMONMENU = mc.menu(p=mainWindow, to=True, l='COMMON')

    mc.menuItem(subMenu=True, l='Common Tool', to=True)
    mc.menuItem(l='Rename Materials', c=__renameMaterials)
    mc.menuItem(l='Change Locator Size', c=__changeLocatorSize)
    mc.menuItem(optionBox=True, c=__showChangeLocatorSize)
    mc.menuItem(l='Change 2 Meter', c=__change2Meter)
    mc.menuItem(l='Replace Node Name', c=__replaceNodeName)
    mc.menuItem(l='Change Absolute Path 2 Relative', c=__relativePath)
    mc.menuItem(l='Install AnimBot', c=__installAnimBot)
    mc.setParent('..', menu=True)

    mc.menuItem(d=True)
    # --------------------------------

    mc.menuItem(subMenu=True, l='Utility Tool', to=True)
    mc.menuItem(l='Repair Maya Tool', c=__repairMayaTool)
    mc.menuItem(l='Update Python Packages', c=__updatePackages)
    mc.setParent('..', menu=True)


createMenu()
