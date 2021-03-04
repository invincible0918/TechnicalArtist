#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/11/18
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : createDummyBind.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import createDummyBindController
    reload(createDummyBindController)
    createDummyBindController.CreateDummyBindController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.CreateDummyBind.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
