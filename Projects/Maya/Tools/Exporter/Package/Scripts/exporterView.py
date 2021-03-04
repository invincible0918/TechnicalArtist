#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/01/10
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : exporterView.py


import os
from Core.MayaGUI.LitFrame.view import View
import functions
reload(functions)
from functions import OPENMAYAFILE, MAYABATCHOUTPUT, EXPORTANIMATION, EXPORFAIL
from Core.MayaGUI.widgets import FileDialog
from functools import partial


class AnimWidget(object):
    def __init__(self,
                 path,
                 load_widget_func,
                 parent):

        row = os.path.join(os.path.split(__file__)[0], '../GUI/row.ui')
        self._widget = load_widget_func(row, parent)

        def open():
            if self._maya_file and os.path.exists(self._maya_file):
                os.startfile(os.path.dirname(self._maya_file))

        self._widget.maLE.setText(path)
        self._widget.openBTN.clicked.connect(open)
        self._widget.setHidden(True)

        self._maya_file = ''
        self._logs = list()
        self._state = None

    @property
    def widget(self):
        return self._widget

    def set_active(self, active):
        self._widget.setHidden(not active)

    def set_text(self, string):
        self._widget.maLE.setText(string)

    def set_maya_file(self, maya_file):
        self._maya_file = maya_file
        self._widget.maLE.setText(self._maya_file)

    def set_log(self, maya_output):
        if self._maya_file in maya_output:
            if EXPORTANIMATION in maya_output:
                self._widget.maLE.setStyleSheet('background-color: green')
                self._state = EXPORTANIMATION
            elif EXPORFAIL in maya_output:
                self._widget.maLE.setStyleSheet('background-color: red')
                self._state = EXPORFAIL
            elif OPENMAYAFILE in maya_output:
                self._widget.maLE.setStyleSheet('background-color: yellow')

            self._widget.maLE.update()
            self._logs.append(maya_output)

            return True
        else:
            return False

    @property
    def state(self):
        return self._state

    @property
    def log(self):
        return '\n'.join(self._logs)


class ExporterView(View):
    MaximumAnimWidget = 200

    def __init__(self):
        # before create ui, it needs to load custom widget first
        from Core.MayaGUI.CustomWidget import dndLineEdit
        reload(dndLineEdit)
        self._registerCustomWidget(dndLineEdit.DNDLineEdit)
        super(ExporterView, self).__init__()

        self._output_log_in_maya = False

    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/dialog.ui')

    def _initGUI(self):
        self._anim_widgets = list()
        for i in range(self.MaximumAnimWidget):
            widget = AnimWidget('', self._loadUiWidget, self._ui)
            self._ui.keyframeDataVBL.addWidget(widget.widget)
            self._anim_widgets.append(widget)

    def _bindMethod(self):
        def clear_log():
            self._ui.logPTE.clear()
            for widget in self._anim_widgets:
                widget.set_active(False)

        def receive(line_edit, evt):
            if evt.mimeData().urls():
                path_string = ';'.join([url.path()[1:] for url in evt.mimeData().urls()])
                line_edit.setText(path_string)

        def export():
            clear_log()

            process_count = int(self._ui.processCountLB.text())
            path_string = self._ui.browserLE.text()
            self._sendMessage('export', process_count, path_string)

        def browser():
            path = FileDialog.getExistingDirectory()
            self._ui.browserLE.setText(path)

        def process_count(count):
            self._ui.processCountLB.setText(str(count))

        def output_log_in_maya(state):
            self._output_log_in_maya = state == 2

        def reference():
            clear_log()

            process_count = int(self._ui.processCountLB.text())
            path_string = self._ui.browserLE.text()
            reference_file_path = self._ui.referenceLE.text()
            self._sendMessage('reference', process_count, path_string, reference_file_path)

        def browser_reference():
            path = FileDialog.getOpenFileName()[0]
            self._ui.referenceLE.setText(path)

        self._ui.browserLE.dropEvent = partial(receive, self._ui.browserLE)
        self._ui.exportBTN.clicked.connect(export)
        self._ui.browserBTN.clicked.connect(browser)
        self._ui.processSLD.valueChanged.connect(process_count)
        self._ui.outputLogCB.stateChanged.connect(output_log_in_maya)

        self._ui.referenceLE.dropEvent = partial(receive, self._ui.referenceLE)
        self._ui.referenceBTN.clicked.connect(reference)
        self._ui.referenceFileBTN.clicked.connect(browser_reference)

    def _get_anim_widget(self, log):
        if MAYABATCHOUTPUT in log:
            for widget in self._anim_widgets:
                maya_output = log.replace('%s: ' % MAYABATCHOUTPUT, '')
                if widget.set_log(maya_output):
                    return widget
        return None

    def _update_progress(self, widget):
        if widget.state == EXPORTANIMATION or widget.state == EXPORFAIL:
            current_index = int(self._ui.numeratorLE.text())
            current_index += 1
            self._ui.numeratorLE.setText(str(current_index))

            self._ui.progressBar.setValue(float(current_index) / self._sum_count * 100)

    def _update_output(self, widget):
        if widget.state:
            self._ui.logPTE.appendPlainText(widget.log)

    def maya_files(self, maya_file_dict):
        count = 0
        for thread_index, maya_files in maya_file_dict.iteritems():
            for i in range(len(maya_files)):
                if count < self.MaximumAnimWidget:
                    self._anim_widgets[count].set_active(True)
                    self._anim_widgets[count].set_maya_file(maya_files[i])
                    count += 1

        self._sum_count = sum([len(v) for v in maya_file_dict.values()])
        self._ui.numeratorLE.setText('0')
        self._ui.denominatorLE.setText(str(self._sum_count))

    def log(self, log_string):
        if self._output_log_in_maya:
            print log_string
        widget = self._get_anim_widget(log_string)
        if widget:
            self._update_progress(widget)
            self._update_output(widget)





