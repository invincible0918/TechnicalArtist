#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/4/13
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : model.py


import subprocess


class Model(object):
    def lateInit(self):
        pass

    def setController(self, controller):
        self.__controller = controller

    def _sendMessage(self, msg, *args):
        return self.__controller.sendMessage(self, msg, *args)

    def _commandEnd(self):
        pass

    def _popen(self, cmd):
        s = subprocess.Popen(cmd, shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout, stderr = s.communicate()

        if stdout:
            print 'OUT'
            stdout = stdout.replace('\r', '\n')
            for log in stdout.split('\n'):
                print log

        if stderr:
            print 'ERR'
            stderr = stderr.replace('\r', '\n')
            for err in stderr.split('\n'):
                print err

        self._commandEnd()
