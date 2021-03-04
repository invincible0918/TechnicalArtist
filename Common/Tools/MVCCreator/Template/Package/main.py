#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : YYYY/MM/DD
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : template.py


PROJECTNAME = 'ProjectName'


def run(**kwargs):
    from Scripts import templateController
    reload(templateController)
    templateController.TemplateController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.Template.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
