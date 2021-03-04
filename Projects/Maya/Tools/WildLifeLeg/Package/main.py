#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/05/16
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : wildLifeLeg.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import wildLifeLegController
    reload(wildLifeLegController)
    wildLifeLegController.WildLifeLegController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.WildLifeLeg.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
