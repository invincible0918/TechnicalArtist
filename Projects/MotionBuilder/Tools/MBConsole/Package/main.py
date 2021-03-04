#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/03/08
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : mBConsole.py


PROJECTNAME = 'MotionBuilder'


def run(**kwargs):
    from Scripts import mBConsoleController

    controller = mBConsoleController.MBConsoleController()
    controller.run(**kwargs)
    return controller


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.MBConsole.Package.Scripts import mBConsoleModel
reload(mBConsoleModel)

from Projects.%s.Tools.MBConsole.Package.Scripts import mBConsoleView
reload(mBConsoleView)

from Projects.%s.Tools.MBConsole.Package.Scripts import mBConsoleController
reload(mBConsoleController)

from Projects.%s.Tools.MBConsole.Package import main
reload(main)

main.run()
    ''' % (PROJECTNAME, PROJECTNAME, PROJECTNAME, PROJECTNAME)
    commandPort.run2MB(command)
