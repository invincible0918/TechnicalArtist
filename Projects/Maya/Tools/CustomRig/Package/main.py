#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/25
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
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
