#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/02/25
# @Company : UBISOFT SHANGHAI
# @Author  : Sun Jing
# @Email   : jing.sun4@ubisoft.com
# @File    : prefMarkerModel.py

import os as os
from Core.MayaGUI.LitFrame.model import Model
from functools import partial
from maya import cmds as mc
from shared.MSVLib.msvPaths import path_manager
import shared.MSVLib.msvTools.msvP4 as msvP4


class PrefMarkerModel(Model):
    def lateInit(self, **kwargs):
        super(PrefMarkerModel, self).lateInit(**kwargs)

    def import_marker_preset(self):
        self.import_path = msvP4.get_local_path("%s\\tools\\dcc\\blue_data\\rig\\wildlife" % path_manager.p4root.local_path)
        self.import_path.replace("\\", "/")
        self.file_path = os.path.join(self.import_path, "Pres_C_Marker.ma")
        mc.file(self.file_path, i=True)

    @classmethod
    def select_the_locator(cls):
        mc.showHidden("C_MarkeReference_Loc")
        mc.select("C_MarkeReference_Loc")

    @classmethod
    def select_the_curve(cls):
        mc.setAttr("Marker_Loc_Layer.displayType", 0)
        mc.setAttr("C_Marker_Crv.scaleX", k=1, l=0)
        mc.setAttr("C_Marker_Crv.scaleY", k=1, l=0)
        mc.setAttr("C_Marker_Crv.scaleZ", k=1, l=0)
        mc.select("C_Marker_Crv")

    @classmethod
    def finish_the_rig(cls):
        mc.setAttr("Marker_Loc_Layer.displayType", 2)
        mc.setAttr("C_Marker_Crv.scaleX", k=0, l=1)
        mc.setAttr("C_Marker_Crv.scaleY", k=0, l=1)
        mc.setAttr("C_Marker_Crv.scaleZ", k=0, l=1)

        mc.hide("C_MarkeReference_Loc")

