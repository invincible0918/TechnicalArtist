#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/3/24
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : baseGUI.py


import sys
import shiboken

from PySide import QtCore, QtGui, QtUiTools
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


class BaseGUI(QtGui.QMainWindow):
    """A bare minimum UI class - showing a .ui file inside Maya 2016"""
    def __init__(self):
        # self.__mayaMain needs to be stored internal
        self.__mayaMain = shiboken.wrapInstance(long(omui.MQtUtil.mainWindow()), QtGui.QWidget)
        super(BaseGUI, self).__init__(self.__mayaMain)

        self._ui = loadUiWidget(self._uiFile, self.__mayaMain)
        self._ui.setAttribute(QtCore.Qt.WA_DeleteOnClose, True)
        self._ui.destroyed.connect(self.__onDestroy)

    def lateInit(self, **kwargs):
        self._kwargs = kwargs
        self._initGUI()
        self._bindMethod()

    def show(self):
        """
        in maya, all of gui only need one instance
        :return:
        """
        for widget in QtGui.QApplication.topLevelWidgets():
            if widget.__class__.__name__ == self.__class__.__name__ and widget != self:
                try:
                    widget.close()
                except:
                    pass

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

    def __onDestroy(self):
        """Do this when the script is closed"""
        sys.stdout.write("You closed the ui!\n")

    def _registerCustomWidget(self, CustomWidget):
        loader = QtUiTools.QUiLoader()
        loader.registerCustomWidget(CustomWidget)

    def _loadUiWidget(self, uiFile, parent):
        """
        :param uiFile:
        :param parent:
        :return:
        """
        return loadUiWidget(uiFile, parent)
