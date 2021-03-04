#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/07/25
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : batchRetarget.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import batchRetargetController
    reload(batchRetargetController)
    batchRetargetController.BatchRetargetController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.BatchRetarget.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
