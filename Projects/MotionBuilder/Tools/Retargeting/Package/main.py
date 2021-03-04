#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/03/15
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : retargeting.py


PROJECTNAME = 'MotionBuilder'


def run(**kwargs):
    from Scripts import retargetingController
    retargetingController.RetargetingController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
import pythonidelib_init

from Projects.%s.Tools.Retargeting.Package.Scripts import retargetingModel
reload(retargetingModel)

from Projects.%s.Tools.Retargeting.Package.Scripts import retargetingView
reload(retargetingView)

from Projects.%s.Tools.Retargeting.Package.Scripts import retargetingController
reload(retargetingController)

from Projects.%s.Tools.Retargeting.Package import main
reload(main)

main.run()

pythonidelib_init.FlushOutput()
    ''' % (PROJECTNAME, PROJECTNAME, PROJECTNAME, PROJECTNAME)
    commandPort.run2MB(command)
