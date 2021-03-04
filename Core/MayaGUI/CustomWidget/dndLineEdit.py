#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 5/9/2018
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : dndLineEdit.py


from Core.MayaGUI.widgets import LineEdit


class DNDLineEdit(LineEdit):
    def __init__(self, parent):
        super(DNDLineEdit, self).__init__(parent)
        self.setAcceptDrops(True)

    def dragEnterEvent(self, e):
        e.accept()

    def dropEvent(self, e):
        e.accept()
