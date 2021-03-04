#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/3/24
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : baseGUI.py

from PySide import QtCore, QtGui, QtUiTools


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
        super(BaseGUI, self).__init__()
        self._ui = loadUiWidget(self._uiFile)

    def lateInit(self):
        self._initGUI()
        self._bindMethod()

    def show(self):
        self._ui.show()
        q = QtCore.QEventLoop()
        # q.exec_()

    def close(self):
        self._ui.close()

    def quitHandler(self):
        pass

    @property
    def _uiFile(self):
        raise NotImplementedError

    def _initGUI(self):
        """
        After init gui
        :return:
        """
        pass

    def _initAppIcon(self, iconPath):
        self._ui.setWindowIcon(QtGui.QIcon(iconPath))

    def _bindMethod(self):
        """
        Bind method to control
        :return:
        """
        pass

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


