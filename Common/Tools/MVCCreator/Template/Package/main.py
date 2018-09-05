#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : YYYY/MM/DD
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : template.py


PROJECTNAME = 'PVZ'


def run(**kwargs):
    from Scripts import templateController
    templateController.TemplateController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.Template.Package.Scripts import templateModel
reload(templateModel)

from Projects.%s.Tools.Template.Package.Scripts import templateView
reload(templateView)

from Projects.%s.Tools.Template.Package.Scripts import templateController
reload(templateController)

from Projects.%s.Tools.Template.Package import main
reload(main)

main.run()
    ''' % (PROJECTNAME, PROJECTNAME, PROJECTNAME, PROJECTNAME)
    commandPort.run(command)
