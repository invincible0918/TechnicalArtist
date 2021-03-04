#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/04/17
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : redNineWrapper.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import redNineWrapperController
    redNineWrapperController.RedNineWrapperController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.RedNineWrapper.Package.Scripts import redNineWrapperModel
reload(redNineWrapperModel)

from Projects.%s.Tools.RedNineWrapper.Package.Scripts import redNineWrapperView
reload(redNineWrapperView)

from Projects.%s.Tools.RedNineWrapper.Package.Scripts import redNineWrapperController
reload(redNineWrapperController)

from Projects.%s.Tools.RedNineWrapper.Package import main
reload(main)

main.run()
    ''' % (PROJECTNAME, PROJECTNAME, PROJECTNAME, PROJECTNAME)
    commandPort.run(command)
