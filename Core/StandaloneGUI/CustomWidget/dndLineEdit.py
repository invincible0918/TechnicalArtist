#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/3/29
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : dndLineEdit.py


from PySide.QtGui import *
from PySide.QtCore import *


class DNDLineEdit(QLineEdit):
    dropped = Signal(QEvent, QLineEdit)

    def __init__(self, parent):
        super(DNDLineEdit, self).__init__(parent)
        self.setAcceptDrops(True)

    def dragEnterEvent(self, e):
        e.accept()

    def dropEvent(self, e):
        e.accept()
        self.dropped.emit(e, self)
