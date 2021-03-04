#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/25
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : customRig.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import customRigController
    reload(customRigController)
    customRigController.CustomRigController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.CustomRig.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
