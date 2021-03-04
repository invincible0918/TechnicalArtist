#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 12/27/2019
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : validationAnimation.py

from Core.MayaGUI import dialog
from validation import Validation
from maya import cmds as mc
from shared.MSVLib.msvTools import msvP4
from blue.dcc.maya.core.referencing.msvReferenceUtils import get_scene_references
from functools import partial


class ValidationAnimation(Validation):
    def validation(self, *args):
        """
        Only work in animation file
        :return:
        """
        maya_file = mc.file(q=True, sn=True).lower().replace('\\', '/')
        if 'animation/character/wildlife' not in maya_file:
            return

        for reference in get_scene_references():
            maya_file = reference.resolved_name
            remote_files = msvP4.get_remote_files(maya_file)
            all_stats = msvP4.get_files_stats(remote_files)

            for f_stat in all_stats:
                have_rev = f_stat.get('haveRev')
                head_rev = f_stat.get('headRev')

                if have_rev != head_rev:
                    message = 'The rig file is not the latest one!\n Click "Confirm" to update!'
                    gui = dialog.ConfirmDialog2(**{'message': message,
                                                 'doConfirm': partial(self.update, maya_file)})
                    gui.show()

    @classmethod
    def update(cls, path):
        msvP4.get_latest_file(path, True, True)
        mc.file(path, o=True, force=True)

