#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/23
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : refreshBindFile.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import refreshBindFileController
    reload(refreshBindFileController)
    refreshBindFileController.RefreshBindFileController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.RefreshBindFile.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
