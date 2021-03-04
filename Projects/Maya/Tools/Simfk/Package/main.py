#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2021/01/05
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
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
