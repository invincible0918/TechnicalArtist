#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/11/18
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
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
