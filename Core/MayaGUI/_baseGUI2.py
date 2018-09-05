#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/3/24
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : baseGUI.py

"""
Only worked the maya version above 2017 due to shipping by Pyside2
"""

import shiboken2 as shiboken


from PySide2 import QtCore, QtGui, QtUiTools
from PySide2.QtGui import QWindow as MainWindow
from PySide2 import QtWidgets as Widget
from PySide2.QtCore import *
from PySide2.QtGui import *
from PySide2.QtWidgets import *
from shiboken2 import wrapInstance

from maya import OpenMayaUI as omui
from Common.Functions.implement import abstract


def loadUiWidget(uiFileName, parent=None):
    """Properly Loads and returns UI files - by BarryPye on stackOverflow"""
    loader = QtUiTools.QUiLoader()
    uiFile = QtCore.QFile(uiFileName)
    uiFile.open(QtCore.QFile.ReadOnly)
    ui = loader.load(uiFile, parent)
    uiFile.close()
    return ui


class BaseGUI(QWidget):
    """A bare minimum UI class - showing a .ui file inside Maya 2016"""
    def __init__(self, *args, **kwargs):
        super(BaseGUI, self).__init__(*args, **kwargs)
        self.__mayaMain = shiboken.wrapInstance(long(omui.MQtUtil.mainWindow()), QWidget)

        self.setParent(self.__mayaMain)
        self.setWindowFlags(Qt.Window)

        self._ui = loadUiWidget(self._uiFile, self)

    def lateInit(self, **kwargs):
        self._kwargs = kwargs
        self._initGUI()
        self._bindMethod()

    def show(self):
        """
        in maya, all of gui only need one instance
        :return:
        """
        self._refresh()
        self._ui.show()

    def close(self):
        self._ui.close()

    @property
    def _uiFile(self): abstract()

    def _initGUI(self):
        """
        After init gui
        :return:
        """
        pass

    def _bindMethod(self):
        """
        Bind method to control
        :return:
        """
        pass

    def _refresh(self):
        """
        Every time open gui
        :return:
        """

    def _loadUiWidget(self, uiFile, parent):
        """
        :param uiFile:
        :param parent:
        :return:
        """
        return loadUiWidget(uiFile, parent)

    def _registerCustomWidget(self, CustomWidget):
        loader = QtUiTools.QUiLoader()
        loader.registerCustomWidget(CustomWidget)

