#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/06/06
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
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
