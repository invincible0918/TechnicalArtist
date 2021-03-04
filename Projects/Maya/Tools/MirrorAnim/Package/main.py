#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/04/29
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : mirrorAnim.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import mirrorAnimController
    mirrorAnimController.MirrorAnimController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.MirrorAnim.Package.Scripts import mirrorAnimModel
reload(mirrorAnimModel)

from Projects.%s.Tools.MirrorAnim.Package.Scripts import mirrorAnimView
reload(mirrorAnimView)

from Projects.%s.Tools.MirrorAnim.Package.Scripts import mirrorAnimController
reload(mirrorAnimController)

from Projects.%s.Tools.MirrorAnim.Package import main
reload(main)

main.run()
    ''' % (PROJECTNAME, PROJECTNAME, PROJECTNAME, PROJECTNAME)
    commandPort.run(command)
