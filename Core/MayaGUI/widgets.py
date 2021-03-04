#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/4/28
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : widgets.py


from maya import mel as mm

VERSION = mm.eval('getApplicationVersionAsFloat()')

if VERSION >= 2017:
    from PySide2.QtGui import *
    from PySide2.QtWidgets import *

    FileDialog = QFileDialog
    PushButton = QPushButton
    Icon = QIcon
    Pixmap = QPixmap
    VBoxLayout = QVBoxLayout
    HBoxLayout = QHBoxLayout

    IntValidator = QIntValidator
    DoubleValidator = QDoubleValidator

    FileSystemModel = QFileSystemModel

    Menu = QMenu
    Action = QAction

    MessageBox = QMessageBox

    CheckBox = QCheckBox
    LineEdit = QLineEdit
    Label = QLabel
else:
    from PySide.QtGui import *

    FileDialog = QFileDialog
    PushButton = QPushButton
    Icon = QIcon
    Pixmap = QPixmap
    VBoxLayout = QVBoxLayout
    HBoxLayout = QHBoxLayout

    IntValidator = QIntValidator
    DoubleValidator = QDoubleValidator

    FileSystemModel = QFileSystemModel

    Menu = QMenu
    Action = QAction

    MessageBox = QMessageBox

    CheckBox = QCheckBox
    LineEdit = QLineEdit
    Label = QLabel

if VERSION >= 2017:
    from PySide2.QtCore import *
else:
    from PySide.QtCore import *

