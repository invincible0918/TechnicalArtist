#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/02/25
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
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
