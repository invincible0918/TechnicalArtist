#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/03/08
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : mBConsoleView.py


import os
from Core.MotionBuilderGUI.LitFrame.view import View
from Core.MotionBuilderGUI.widgets import Qt, LineEdit, Label
from functools import partial


class MBConsoleView(View):
    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/dialog.ui')

    def _initGUI(self):
        pass

    def _bindMethod(self):
        # pass
        self._ui.clearBTN.clicked.connect(partial(self.__clear, self._ui.scrollViewLayout))

    def __clear(self, scrollLayout):
        for i in reversed(range(scrollLayout.count())):
            widgetToRemove = scrollLayout.itemAt(i).widget()
            if widgetToRemove:
                scrollLayout.removeWidget(widgetToRemove)
                widgetToRemove.setParent(None)

    def refresh(self, *args):
        logMsg = args[0]
        parent = args[1]
        refresh = args[2]

        scrollLayout = parent.scrollViewLayout
        scrollLayout.setAlignment(Qt.AlignTop)

        if refresh:
            self.__clear(scrollLayout)

        l = Label()
        l.setText(logMsg)
        l.setTextInteractionFlags(Qt.TextSelectableByMouse)
        l.setParent(parent)
        scrollLayout.addWidget(l)
