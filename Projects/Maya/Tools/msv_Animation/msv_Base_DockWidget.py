import os
from PySide2 import QtCore, QtGui, QtUiTools
from shared.MSVLib.msvGui.msvWindow import DockWidget


class BaseDockWidgetModel(object):
    def __init__(self, view_instance):
        super(BaseDockWidgetModel, self).__init__()
        self._view_instance = view_instance

    def _send_message(self, method, *args):
        if hasattr(self._view_instance, method):
            getattr(self._view_instance, method)(*args)
        else:
            print 'view "%s" has no method "%s"' % (self._view_instance, method)


class BaseDockWidgetView(DockWidget):
    NAME = "BASE DOCK WIDGET"

    def __init__(self, parent):
        super(BaseDockWidgetView, self).__init__(parent)
        self.setParent(parent)

        if self.ui_path:
            loader = QtUiTools.QUiLoader()
            ui_file = QtCore.QFile(os.path.join(os.path.dirname(os.path.realpath(__file__)), self.ui_path))
            ui_file.open(QtCore.QFile.ReadOnly)

            self._ui = loader.load(ui_file, parent)
            self.setWidget(self._ui)
            ui_file.close()

        self.load_settings()
        self._bind_methods()

        self._create_model_instance()
        # self._model_instance = BaseDockWidgetModel(self)

    @classmethod
    def register_custom_widget(cls, custom_widget):
        loader = QtUiTools.QUiLoader()
        loader.registerCustomWidget(custom_widget)

    @property
    def ui_path(self):
        return ''

    @property
    def ui(self):
        return self._ui

    def _bind_methods(self):
        pass

    def _create_model_instance(self):
        raise NotImplementedError

    def _send_message(self, method, *args):
        if hasattr(self._model_instance, method):
            getattr(self._model_instance, method)(*args)
        else:
            print 'model "%s" has no method "%s"' % (self._model_instance, method)
