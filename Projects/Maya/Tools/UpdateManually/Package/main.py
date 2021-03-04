#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/01/03
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : updateManually.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import updateManuallyController
    reload(updateManuallyController)
    updateManuallyController.UpdateManuallyController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.UpdateManually.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
