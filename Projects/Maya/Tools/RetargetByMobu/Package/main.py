#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/05/02
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
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
