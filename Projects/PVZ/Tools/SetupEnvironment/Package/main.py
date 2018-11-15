#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/04/18
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : setupEnvironment.py


PROJECTNAME = 'PVZ'


def run(**kwargs):
    from Scripts import setupEnvironmentController
    setupEnvironmentController.SetupEnvironmentController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.SetupEnvironment.Package.Scripts import setupEnvironmentModel
reload(setupEnvironmentModel)

from Projects.%s.Tools.SetupEnvironment.Package.Scripts import setupEnvironmentView
reload(setupEnvironmentView)

from Projects.%s.Tools.SetupEnvironment.Package.Scripts import setupEnvironmentController
reload(setupEnvironmentController)

from Projects.%s.Tools.SetupEnvironment.Package import main
reload(main)

main.run()
    ''' % (PROJECTNAME, PROJECTNAME, PROJECTNAME, PROJECTNAME)
    commandPort.run(command)
