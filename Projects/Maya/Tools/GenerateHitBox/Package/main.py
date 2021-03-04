#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/23
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : generateHitBox.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import generateHitBoxController
    reload(generateHitBoxController)
    generateHitBoxController.GenerateHitBoxController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.GenerateHitBox.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
