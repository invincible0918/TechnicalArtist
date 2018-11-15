#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/04/18
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : setupEnvironmentView.py


import os
from Core.MayaGUI.LitFrame.view import View
from Core.MayaGUI.widgets import Qt
from functools import partial


class BranchWidget(object):
    def __init__(self,
                 depotPath,
                 workspacePath,
                 exported,
                 sendMessageFunc,
                 loadWidgetFunc,
                 parent):

        self.__sendMessageFunc = sendMessageFunc

        branchUI = os.path.join(os.path.split(__file__)[0], '../GUI/branchWidget.ui')
        self.__widget = loadWidgetFunc(branchUI, parent)

        self.__widget.depotLE.setText(depotPath)
        self.__widget.exportBranchCB.setChecked(exported)
        self.__widget.exportBranchCB.stateChanged.connect(partial(self.__clickCB, depotPath))

        self.__widget.workspaceLE.setText(workspacePath)
        self.__widget.browserBTN.clicked.connect(partial(self.__clickBTN, workspacePath))

    def __clickCB(self, depot, state):
        # state == 2 means export branch
        self.__sendMessageFunc('exportBranch', depot, state == 2)

    def __clickBTN(self, path):
        if path and os.path.exists(path):
            os.startfile(path)

    @property
    def widget(self):
        return self.__widget


class SetupEnvironmentView(View):
    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/gui.ui')

    def _initGUI(self):
        super(SetupEnvironmentView, self)._initGUI()
        self.__user = ''
        self.__password = ''

    def _bindMethod(self):
        # user name and password
        def __returnPressed(instance, control, var):
            setattr(instance, var, control.text())

        def __textChanged(instance, control, var, e):
            """
            :param control:
            :param e: the control's text value
            :return:
            """
            setattr(instance, var, control.text())

        self._ui.nameLE.returnPressed.connect(partial(__returnPressed, self, self._ui.nameLE, '_SetupEnvironmentView__user'))
        self._ui.nameLE.textChanged.connect(partial(__textChanged, self, self._ui.nameLE, '_SetupEnvironmentView__user'))
        self._ui.passwordLE.returnPressed.connect(partial(__returnPressed, self, self._ui.passwordLE, '_SetupEnvironmentView__password'))
        self._ui.passwordLE.textChanged.connect(partial(__textChanged, self, self._ui.passwordLE, '_SetupEnvironmentView__password'))

        # click refresh button
        def __userInfo():
            if self.__user and self.__password:
                self._sendMessage('userInfo', self.__user, self.__password)

        self._ui.refreshBTN.clicked.connect(__userInfo)

    # public interface
    def config(self, data):
        self._ui.nameLE.setText(data['user'])
        self._ui.passwordLE.setText(data['password'])

    def branchPath(self, branchData):
        scrollLayout = self._ui.scrollViewLayout
        scrollLayout.setAlignment(Qt.AlignTop)

        for i in reversed(range(scrollLayout.count())):
            widgetToRemove = scrollLayout.itemAt(i).widget()
            if widgetToRemove:
                scrollLayout.removeWidget(widgetToRemove)
                widgetToRemove.setParent(None)

        for k, v in branchData.items():
            if not v['workspace']:
                continue

            widget = BranchWidget(k,
                                  v['workspace'],
                                  v['checked'],
                                  self._sendMessage,
                                  self._loadUiWidget,
                                  self._ui)
            scrollLayout.addWidget(widget.widget)

