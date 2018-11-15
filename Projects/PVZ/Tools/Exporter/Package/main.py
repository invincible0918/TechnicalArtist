#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/04/18
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : exporter.py


PROJECTNAME = 'PVZ'


def run(**kwargs):
    from Scripts import exporterController
    exporterController.ExporterController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.Exporter.Package.Scripts import exporter
reload(exporter)


from Projects.%s.Tools.Exporter.Package.Scripts import modelExporter
reload(modelExporter)


from Projects.%s.Tools.Exporter.Package.Scripts import previewExporter
reload(previewExporter)


from Projects.%s.Tools.Exporter.Package.Scripts import animExporter
reload(animExporter)


from Projects.%s.Tools.Exporter.Package.Scripts import exporterModel
reload(exporterModel)


from Projects.%s.Tools.Exporter.Package.Scripts import exporterView
reload(exporterView)


from Projects.%s.Tools.Exporter.Package.Scripts import exporterController
reload(exporterController)


from Projects.%s.Tools.Exporter.Package import main
reload(main)


main.run()
    ''' % (PROJECTNAME,
           PROJECTNAME,
           PROJECTNAME,
           PROJECTNAME,
           PROJECTNAME,
           PROJECTNAME,
           PROJECTNAME,
           PROJECTNAME)
    commandPort.run(command)
