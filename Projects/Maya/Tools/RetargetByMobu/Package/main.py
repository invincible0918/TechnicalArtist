#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/05/02
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : retargetByMobu.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import retargetByMobuController
    reload(retargetByMobuController)
    retargetByMobuController.RetargetByMobuController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.RetargetByMobu.Package import main
reload(main)

main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
