#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/07/25
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : batchRetargetView.py


from Core.MayaGUI.LitFrame.view import View
from Core.MayaGUI.widgets import FileDialog
from functools import partial
import os
# from shared.MSVLib.msvGui.msvGuiUtils import get_main_window
# # from blue.dcc.maya.core.batch.msvMayaBatch import BatchManagerMaya
# # from blue.MSVLib.msvBatch import BatchTaskBase
# from msv_Base_DockWidget import BaseDockWidgetView, BaseDockWidgetModel
# from PySide2.QtWidgets import QLineEdit, QFileDialog
# from functools import partial
# from blue.dcc.maya.core.referencing.msvReferenceUtils import get_scene_references
# from shared.dcc.maya.core.msvTime import get_current_time_range
# from Red9.core.Red9_Meta import getMetaNodes
# import Red9.core.Red9_Meta as r9Meta
# import Red9.core.AnimationBinder as anim_binder
# import blue.dcc.maya.core.referencing.msvReferenceRedirector as refRedir
#
# from maya import cmds as mc
# from maya import OpenMaya as om


class BatchRetargetView(View):
    def __init__(self):
        # before create ui, it need to load custom widget first
        from Core.MayaGUI.CustomWidget import dndLineEdit
        reload(dndLineEdit)
        self._registerCustomWidget(dndLineEdit.DNDLineEdit)
        super(BatchRetargetView, self).__init__()

    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/dialog.ui')

    def _initGUI(self):
        pass

    def _bindMethod(self):
        def refresh(path, line_edit):
            line_edit.setText(path)

        def browse_folder(line_edit):
            refresh(FileDialog.getExistingDirectory(), line_edit)

        def browse_file():
            refresh(FileDialog.getOpenFileName()[0], self._ui.binderPathLE)

        def receive(*args):
            line_edit = args[0]
            evt = args[1]
            if evt.mimeData().urls():
                refresh(evt.mimeData().urls()[0].path()[1:], line_edit)

        def get_parameters():
            binder_file = self._ui.binderPathLE.text()
            source_folder_path = self._ui.sourceFolderLE.text()
            dest_folder_path = self._ui.destFolderLE.text()
            if os.path.exists(binder_file) and \
                    os.path.isfile(binder_file) and \
                    os.path.exists(source_folder_path) and \
                    os.path.isdir(source_folder_path) and \
                    os.path.exists(dest_folder_path) and \
                    os.path.isdir(dest_folder_path):
                return binder_file, source_folder_path, dest_folder_path
            else:
                return None

        def batch_import():
            args = get_parameters()
            self._sendMessage('batch_import_in_maya', *args)

        def batch_remove():
            args = get_parameters()
            self._sendMessage('batch_remove_in_maya', *args)

        def batch_retarget():
            args = get_parameters()
            self._sendMessage('batch_retarget_in_maya', *args)

        self._ui.binderBTN.clicked.connect(browse_file)
        self._ui.binderPathLE.dropEvent = partial(receive, self._ui.binderPathLE)

        self._ui.sourceBrowserBTN.clicked.connect(partial(browse_folder, self._ui.sourceFolderLE))
        self._ui.sourceFolderLE.dropEvent = partial(receive, self._ui.sourceFolderLE)

        self._ui.destBrowserBTN.clicked.connect(partial(browse_folder, self._ui.destFolderLE))
        self._ui.destFolderLE.dropEvent = partial(receive, self._ui.destFolderLE)

        self._ui.importAnimBTN.clicked.connect(batch_import)
        self._ui.removeAnimBTN.clicked.connect(batch_remove)
        self._ui.batchRetargetBTN.clicked.connect(batch_retarget)

    def update_progress_bar(self, value):
        self._ui.progressBar.setValue(value)

    def operation_on(self, value):
        self._ui.mayaLB.setText(value)


