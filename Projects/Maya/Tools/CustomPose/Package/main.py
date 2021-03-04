#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/07/09
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
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
