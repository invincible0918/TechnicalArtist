#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/07/09
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : customPose.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import customPoseController
    reload(customPoseController)
    customPoseController.CustomPoseController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.CustomPose.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
