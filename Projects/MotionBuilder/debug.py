#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 3/8/2019
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : debug.py


PROJECTNAME = 'MotionBuilder'


def main():
    import animationScriptsAndFiles
    reload(animationScriptsAndFiles)
    animationScriptsAndFiles.run()
    return

    # red = FBColor(1, 0, 0)
    # skeleton1 = createSkeleton('mySkeleton1', red)
    # skeleton1['Reference'].Translation = FBVector3d(-100, 0, 0)
    #
    # green = FBColor(0, 1, 0)
    # skeleton2 = createSkeleton('mySkeleton2', green)
    # skeleton2['Reference'].Translation = FBVector3d(100, 0, 0)
    #
    # characterizeSkeleton('testCharacter', skeleton1)


if __name__ in ('__main__', '__builtin__'):
    from Common.Tools.CommandPort import commandPort
    reload(commandPort)

    command = '''
import pythonidelib_init
from Projects.%s import debug
reload(debug)
debug.main()
pythonidelib_init.FlushOutput()

        ''' % PROJECTNAME

    commandPort.run2MB(command)
