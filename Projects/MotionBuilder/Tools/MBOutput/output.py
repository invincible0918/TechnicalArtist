#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 3/11/2019
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : output.py


from Core.MotionBuilderGUI.widgets import AppInstance
from Projects.MotionBuilder.Tools.MBConsole.Package.Scripts import mBConsoleModel
reload(mBConsoleModel)

from Projects.MotionBuilder.Tools.MBConsole.Package.Scripts import mBConsoleView
reload(mBConsoleView)

from Projects.MotionBuilder.Tools.MBConsole.Package.Scripts import mBConsoleController
reload(mBConsoleController)

from Projects.MotionBuilder.Tools.MBConsole.Package import main
reload(main)


def log(logMsg, refresh=False):
    # find out the title of all non-hidden top-level windows
    parent = None
    tops = AppInstance.topLevelWidgets()
    for top in tops:
        if top.isWindow() and not top.isHidden():
            if 'Log Output Window' == top.windowTitle():
                parent = top
                break

    # open a new thread to refresh main gui
    if not parent:
        global controller
        controller = main.run()
        parent = controller.view._ui

    controller.view.refresh(logMsg, parent, refresh)
