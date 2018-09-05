#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/4/13
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : view.py


from Core.StandaloneGUI.baseGUI import BaseGUI


class View(BaseGUI):
    def setController(self, controller):
        self.__controller = controller

    def _sendMessage(self, msg, *args):
        return self.__controller.sendMessage(self, msg, *args)


