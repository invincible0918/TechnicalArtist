#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/05/09
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : animalToTalisker.py


PROJECTNAME = 'Blue'


def run(**kwargs):
    from Scripts import animalToTaliskerController
    animalToTaliskerController.AnimalToTaliskerController().run(**kwargs)


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Projects.%s.Tools.AnimalToTalisker.Package.Scripts import animalToTaliskerModel
reload(animalToTaliskerModel)

from Projects.%s.Tools.AnimalToTalisker.Package.Scripts import animalToTaliskerView
reload(animalToTaliskerView)

from Projects.%s.Tools.AnimalToTalisker.Package.Scripts import animalToTaliskerController
reload(animalToTaliskerController)

from Projects.%s.Tools.AnimalToTalisker.Package import main
reload(main)

main.run()
    ''' % (PROJECTNAME, PROJECTNAME, PROJECTNAME, PROJECTNAME)
    commandPort.run(command)
