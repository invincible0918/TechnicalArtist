#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2021/02/23
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : simpleGUI.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import simpleGUIController
    reload(simpleGUIController)
    simpleGUIController.SimpleGUIController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.SimpleGUI.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
