#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/06/06
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : legSetup.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import legSetupController
    reload(legSetupController)
    legSetupController.LegSetupController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.LegSetup.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
