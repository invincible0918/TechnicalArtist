#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/2/23
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : dialog.py


from abc import ABCMeta, abstractmethod, abstractproperty
from maya import cmds as mc
from baseGUI import BaseGUI

import os


class ModalWindow(object):
    __metaclass__ = ABCMeta

    def __init__(self, *args, **kwargs):
        self._args = args
        self._kwargs = kwargs

    @abstractmethod
    def show(self):
        pass


class LayoutDialog(ModalWindow):
    __metaclass__ = ABCMeta

    def __init__(self, *args, **kwargs):
        super(LayoutDialog, self).__init__(*args, **kwargs)

    @abstractmethod
    def _layout(self):
        pass

    def show(self):
        return mc.layoutDialog(ui=self._layout)


class ConfirmDialog(ModalWindow):
    def __init__(self, *args, **kwargs):
        super(ConfirmDialog, self).__init__(*args, **kwargs)

        self._confirm = 'OK'
        self._cancel = 'Cancel'

        self._kvp = {'title': self._kwargs.get('title', ''),
                     'message': self._kwargs.get('message', ''),
                     'button': [self._confirm, self._cancel],
                     'defaultButton': self._confirm,
                     'cancelButton': self._cancel,
                     'dismissString': self._cancel}

        self._gui = mc.confirmDialog

    def show(self):
        return self._gui(**self._kvp)

    @property
    def confirm(self):
        return self._confirm

    @property
    def cancel(self):
        return self._cancel


class PromptDialog(ConfirmDialog):
    def __init__(self, *args, **kwargs):
        super(PromptDialog, self).__init__(*args, **kwargs)

        self._kvp.update({'text': self._kwargs.get('text', '')})
        self._gui = mc.promptDialog

    @property
    def text(self):
        return self._gui(query=True, text=True)


class ConfirmDialog2(BaseGUI):
    """
    Confirm Dialog with one button, it's not modal
    """
    def __init__(self, *args, **kwargs):
        super(ConfirmDialog2, self).__init__()

        self._ui.setWindowTitle(kwargs.get('title', ''))
        self._ui.label.setText(kwargs.get('message', ''))

        self.__doConfirm = kwargs.get('doConfirm', None)
        self._ui.confirm.clicked.connect(self.__confirm)

    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], 'dialog.ui')

    def __confirm(self):
        if self.__doConfirm:
            self.__doConfirm()

        self._ui.close()





