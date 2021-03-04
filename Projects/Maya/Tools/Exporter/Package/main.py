#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/01/10
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : exporter.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import exporterController
    reload(exporterController)
    exporterController.ExporterController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.Exporter.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
