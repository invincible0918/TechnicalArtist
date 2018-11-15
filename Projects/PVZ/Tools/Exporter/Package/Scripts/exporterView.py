#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/04/18
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : exporterView.py


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


class ExporterView(View):
    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/gui.ui')

    def _initGUI(self):
        pass

    def _bindMethod(self):
        self._ui.tabWidget.currentChanged.connect(partial(self._sendMessage, 'changeExportIndex'))

        # click button event
        self._ui.exportTPoseBTN.clicked.connect(partial(self.__export, 'tpose'))
        self._ui.exportAnimBTN.clicked.connect(partial(self.__export, 'anim'))
        self._ui.exportPropBTN.clicked.connect(partial(self.__export, 'prop'))
        self._ui.exportAnimedPropBTN.clicked.connect(partial(self.__export, 'animedProp'))
        self._ui.exportPreviewModelBTN.clicked.connect(partial(self.__export, 'previewModel'))

    def __export(self, type):
        # bakeKeyframe = self._ui.bakeKeyframeCB.isChecked()
        self._sendMessage('export', type)

    # public method
    def exportConfigData(self, data):
        self._ui.tabWidget.setCurrentIndex(data['exportTabIndex'])

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
