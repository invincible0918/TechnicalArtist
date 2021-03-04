#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/4/13
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : view.py


from Core.MotionBuilderGUI.baseGUI import BaseGUI


class View(BaseGUI):
    def setController(self, controller):
        self.__controller = controller

    def _sendMessage(self, msg, *args):
        return self.__controller.sendMessage(self, msg, *args)


