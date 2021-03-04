#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/06/03
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : alignObject.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import alignObjectController
    reload(alignObjectController)
    alignObjectController.AlignObjectController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.AlignObject.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)

