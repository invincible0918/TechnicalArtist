#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/05/03
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : mirrorAnim.py


PROJECTNAME = 'INV'


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
