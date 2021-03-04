#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2021/01/05
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : simfk.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import simfkController
    reload(simfkController)
    simfkController.SimfkController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.Simfk.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
