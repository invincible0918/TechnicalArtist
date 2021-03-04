#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2021/02/23
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
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
