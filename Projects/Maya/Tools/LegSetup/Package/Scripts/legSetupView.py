#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/06/06
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : legSetupView.py


import os
from Core.MayaGUI.LitFrame.view import View
from Core.MayaGUI import dialog
from functools import partial
from maya import cmds as mc


class LegSetupView(View):
    def __init__(self):
        # before create ui, it need to load custom widget first
        from Core.MayaGUI.CustomWidget import dndLineEdit
        reload(dndLineEdit)
        self._registerCustomWidget(dndLineEdit.DNDLineEdit)

        super(LegSetupView, self).__init__()

    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/dialog.ui')

    def _initGUI(self):
        pass

    def _bindMethod(self):
        def refresh(node, *args):
            if mc.objExists(node):
                dndLE = args[1]
                dndLE.setText(node)
                # self._sendMessage('select', path, groupName)
                # self.close()
            else:
                gui = dialog.ConfirmDialog2(**{'message': 'Can not find joint "%s" ' % node})
                gui.show()

        def receive(args, e):
            nodeFullPathName = e.mimeData().text()
            if nodeFullPathName:
                refresh(nodeFullPathName, *args)

        def returnPressed(*args):
            refresh(args[1].text(), *args)

        def do():
            startJoint = self._ui.startJointDNDLE.text()
            endJoint = self._ui.endJointDNDLE.text()

            errorMsg = ''
            if not mc.objExists(startJoint) or mc.nodeType(startJoint) != 'joint':
                errorMsg += startJoint + ';\n'

            if not mc.objExists(endJoint) or mc.nodeType(endJoint) != 'joint':
                errorMsg += endJoint + ';\n'

            if not errorMsg:
                if startJoint == endJoint:
                    errorMsg += 'start joint and end joint can not be the same!'
            else:
                errorMsg = 'Can not find joint:\n %s' % errorMsg

            if not errorMsg:
                self._sendMessage('do', startJoint, endJoint)
            else:
                gui = dialog.ConfirmDialog2(**{'message': errorMsg})
                gui.show()

        self._ui.startJointDNDLE.dropEvent = partial(receive, ('startJoint', self._ui.startJointDNDLE))
        self._ui.startJointDNDLE.returnPressed.connect(partial(returnPressed, 'startJoint', self._ui.startJointDNDLE))

        self._ui.endJointDNDLE.dropEvent = partial(receive, ('endJoint', self._ui.endJointDNDLE))
        self._ui.endJointDNDLE.returnPressed.connect(partial(returnPressed, 'endJoint', self._ui.endJointDNDLE))

        self._ui.doBTN.clicked.connect(do)

