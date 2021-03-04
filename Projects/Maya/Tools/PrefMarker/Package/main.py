#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/02/25
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : prefMarker.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import prefMarkerController
    reload(prefMarkerController)
    prefMarkerController.PrefMarkerController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.PrefMarker.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
