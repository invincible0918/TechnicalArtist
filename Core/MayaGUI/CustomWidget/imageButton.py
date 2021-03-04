#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/5/18
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : imageButton.py

import threading

from Core.MayaGUI.widgets import PushButton, Icon
from PySide.QtCore import QSize


class LoadTextures(threading.Thread):
    def __init__(self, filePath, widget):
        super(LoadTextures, self).__init__()
        self.__filePath = filePath
        self.__widget = widget

    def run(self):
        icon = Icon(self.__filePath)
        self.__widget.setIcon(icon)


class ImageButton(PushButton):
    def __init__(self, imagePath, width, height, parent=None):
        super(ImageButton, self).__init__(parent)

        self.__width = width
        self.__height = height

        self.setIconSize(QSize(self.__width, self.__height))
        self.setFixedSize(self.__width, self.__height)

        if imagePath:
            thread = LoadTextures(imagePath, self)
            thread.start()

    # def setIcon(self, icon):
    #     self.setIcon(icon)
    #     # self.setIconSize(QSize(self.__width, self.__height))
    #     # self.setFixedSize(self.__width, self.__height)


