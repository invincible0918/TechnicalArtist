#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/03/26
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : proceduralAnim.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import proceduralAnimController
    reload(proceduralAnimController)
    proceduralAnimController.ProceduralAnimController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.ProceduralAnim.Package import main
reload(main)
main.run()
    ''' % PROJECTNAME
    commandPort.run(command)
