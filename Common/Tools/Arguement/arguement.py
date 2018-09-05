#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/11/27
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : arguement.py


"""
arguement always like this:
--user --password --delete E:/Projects/MyProject000/FD/Ghost/app/res/master/models/tt0.txt,E:/Projects/MyProject000/FD/Ghost/app/res/master/models/tt1.txt --msg add test datas --port eamc-perforce.eamobile.ad.ea.com:1666 --branchPath E:/Projects/MyProject000/FD
use "--" to split key and value
"""


def __doArguements(args):
    def func(longArgs, di):
        _longArgs = longArgs[2:]
        index = _longArgs.find('--')
        if index == -1:
            _args = _longArgs
            nextArgs = ''
        else:
            _args = _longArgs[:index]
            nextArgs = _longArgs[index:]

        _index = _args.find(' ')
        if _index == -1:
            key = _args
            value = ''
        else:
            key = _args[:_index]
            value = _args[_index+1:]
        di.update({key: value})

        if nextArgs:
            func(_longArgs[index:], di)

    longArgs = ' '.join(args)
    argueDict = {}

    func(longArgs, argueDict)

    return argueDict


def processArguement(longArguementString):
    return __doArguements(longArguementString)
