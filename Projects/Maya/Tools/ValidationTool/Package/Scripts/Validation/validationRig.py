#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 12/27/2019
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : validationMesh.py

from Core.MayaGUI import dialog
from validation import Validation
from maya import cmds as mc
from shared.MSVLib.msvTools import msvP4
import os


class ValidationRig(Validation):
    def validation(self, *args):
        """
        Only work in rig file
        :return:
        """
        maya_file = mc.file(q=True, sn=True)
        if '_rig' not in os.path.basename(maya_file).lower():
            return

        maya_file = mc.file(q=True, sn=True)
        remote_files = msvP4.get_remote_files(maya_file)
        all_stats = msvP4.get_files_stats(remote_files)

        for f_stat in all_stats:
            have_rev = f_stat.get('haveRev')
            head_rev = f_stat.get('headRev')

            if have_rev != head_rev:
                message = 'This rig file is not the latest one! Please update!'
                gui = dialog.ConfirmDialog2(**{'message': message})
                gui.show()

