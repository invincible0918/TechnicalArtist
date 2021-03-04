#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/18
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : motionPath.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import motionPathController
    reload(motionPathController)
    motionPathController.MotionPathController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.MotionPath.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
