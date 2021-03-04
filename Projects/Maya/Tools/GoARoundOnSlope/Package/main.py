#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/08/20
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : goARoundOnSlope.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import goARoundOnSlopeController
    reload(goARoundOnSlopeController)
    goARoundOnSlopeController.GoARoundOnSlopeController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.GoARoundOnSlope.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
