#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/01/03
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : updateManually.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import updateManuallyController
    reload(updateManuallyController)
    updateManuallyController.UpdateManuallyController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.UpdateManually.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
