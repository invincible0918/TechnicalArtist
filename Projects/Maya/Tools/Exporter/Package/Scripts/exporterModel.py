#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/01/10
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : exporterModel.py

import os
import subprocess
from Core.MayaGUI.LitFrame.model import Model
from Common.Tools.InvokeScript import invokeScript
reload(invokeScript)


class ExporterModel(Model):
    def lateInit(self, **kwargs):
        super(ExporterModel, self).lateInit(**kwargs)

    def reference(self, process_count, paths, reference_file):
        mayapy = r'C:\Program Files\Autodesk\Maya2017\bin\mayapy.exe'
        script_path = os.path.join(os.path.split(__file__)[0], 'mayaReference.py')
        maya_files = self._get_maya_files(paths, process_count)
        self._sendMessage('maya_files', maya_files)

        for thread_index, maya_files in maya_files.iteritems():
            cmd = '"%s" "%s" "%s"' % (mayapy,
                                      script_path,
                                      ';'.join(maya_files + [reference_file]))

            self._invoke_script(cmd)

    def export(self, process_count, paths):
        mayapy = r'C:\Program Files\Autodesk\Maya2017\bin\mayapy.exe'
        script_path = os.path.join(os.path.split(__file__)[0], 'mayaExporter.py')
        # animation_dir = r'D:\p4ws\wlm_AC617_blue\source\blue\Animation\Character\Wildlife\Sturmbeest\Locomotion'
        # animation_dir = r'D:\p4ws\wlm_AC617_blue\source\blue\Animation\Rigs\Wildlife\Thanator\Retarget_Des'
        maya_files = self._get_maya_files(paths, process_count)
        self._sendMessage('maya_files', maya_files)

        for thread_index, maya_files in maya_files.iteritems():
            cmd = '"%s" "%s" "%s"' % (mayapy,
                                      script_path,
                                      ';'.join(maya_files))

            self._invoke_script(cmd)

    def _output(self, log):
        log_string = log.replace('Console output: ', '')
        self._sendMessage('log', log_string)

    def _invoke_script(self, cmd):
        out = invokeScript.OutputStream(self._output)
        err = invokeScript.OutputStream(self._output)
        proc = subprocess.Popen(cmd, shell=True, stdout=out, stderr=err)

        # proc.wait()
        # while proc.poll() is not None:
        #     print '?'
        self._output('returncode: %s' % proc.returncode)


    @classmethod
    def _get_maya_files(cls, path_string, process_count):
        def filter_file(file_path, count, di):
            if file_path.lower().endswith('.ma'):
                index = count % process_count
                if index not in di:
                    di[index] = list()
                di[index].append(file_path)
                return True
            else:
                return False

        if not path_string:
            return {}

        paths = [path for path in path_string.split(';') if os.path.exists(path)]

        maya_file_dict = dict()
        count = 0

        for path in paths:
            if os.path.isdir(path):
                for root, dirs, files in os.walk(path):
                    for f in files:
                        if filter_file(os.path.join(root, f), count, maya_file_dict):
                            count += 1
            elif os.path.isfile(path):
                if filter_file(path, count, maya_file_dict):
                    count += 1

        return maya_file_dict




