#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/6/19
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : dndLabel.py


from Core.StandaloneGUI.widgets import Label


class DNDLabel(Label):
    def __init__(self, parent):
        super(DNDLabel, self).__init__(parent)
        self.setAcceptDrops(True)

    def dragEnterEvent(self, e):
        e.accept()

    def dropEvent(self, e):
        e.accept()

