#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/01/08
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : ragdollTool.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import ragdollToolController
    reload(ragdollToolController)
    ragdollToolController.RagdollToolController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.RagdollTool.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
