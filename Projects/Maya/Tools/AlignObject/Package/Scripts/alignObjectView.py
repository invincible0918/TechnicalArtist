#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/06/03
# @Company : INVINCIBLE STUDIO
# @Author  : Sun Jing
# @Email   : jing.sun4@ubisoft.com
# @File    : alignObjectView.py


import os
from Core.MayaGUI.LitFrame.view import View
from functools import partial
import maya.cmds as cmds
import getpass


class AlignObjectView(View):
    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/dialog.ui')

    def _initGUI(self):
        pass

    def _bindMethod(self):
        self._ui.selectBTN.clicked.connect(self.add_to_list)
        self._ui.clearBTN.clicked.connect(self.clear_list)
        self._ui.exportBTN.clicked.connect(self.export_locators)
        self._ui.bakeBTN.clicked.connect(self.bake_objects)

    def add_to_list(self):
        print("add to list")
        aw_objs = cmds.ls(sl=1)
        for i in aw_objs:
            self._ui.selectedLSW.addItem(i)
        return aw_objs

    def clear_list(self):
        self._ui.selectedLSW.clear()

    # def get_selected_list(self):
    #     aw_listed = self._ui.selectedLSW.currentItem().text()
    #     print aw_listed
    #     return aw_listed

    def create_locators(self, aw_selected):
        aw_locators = []
        for i in aw_selected:
            aw_name = i + "_locx"
            aw_locator = cmds.spaceLocator(n=aw_name)
            aw_locators.append(aw_locator)
            if len(aw_locators) > 1:
                cmds.parent(aw_locators[-1], aw_locators[-2])
            if len(aw_locators) > 0:
                cmds.parentConstraint(i, aw_locator[-1], mo=0)

        return aw_locators

    def bake_animations(self, aw_selected, min_time, max_time):
        for i in aw_selected:
            cmds.bakeResults(i, t=(min_time, max_time), simulation=True)
            cmds.select(i)
            print(i)
            aw_source_nodes = cmds.listConnections(source=1)
            print(aw_source_nodes)
            for j in aw_source_nodes:
                aw_splits = j.split("_")
                if aw_splits[-1] == "parentConstraint1":
                    cmds.delete(j)
                    break

    def get_time_range(self):
        aw_min_time = cmds.playbackOptions(minTime=1, q=1)
        aw_max_time = cmds.playbackOptions(maxTime=1, q=1)
        aw_time_range = [aw_min_time, aw_max_time]
        print type(aw_time_range[0])
        return aw_time_range

    def export_locators(self):
        aw_selected = self.add_to_list()

        aw_locators = self.create_locators(aw_selected)

        aw_time_range = self.get_time_range()

        self.bake_animations(aw_locators, aw_time_range[0], aw_time_range[1])

        cmds.select(aw_locators[0])

        #cmds.file(cls._tmp_joint_file_path(), force=True, options='v=0;', typ='FBX export', pr=True, es=True)
        aw_username = getpass.getuser()
        cmds.file("C:/Users/" + aw_username + "/Desktop/tempLocators.fbx", force=1, options='v=0;', typ="FBX export", pr=1, es=1)
        #print("successfully")

    def bake_objects(self):
        aw_username = getpass.getuser()
        cmds.file("C:/Users/" + aw_username + "/Desktop/tempLocators.fbx", i=1, mergeNamespaceWithRoot=1,options='v=0;',pr=1, importFrameRate=1,importTimeRange="override")
        #cmds.file("C:/Users/jsun4/Desktop/hyperdeerlocator.ma", i = 1, type =" mayaAscii", ignoreVersion = 1, mergeNamespacesOnClash = 0, options='v=0;', pr=1, importFrameRate = 1, importTimeRange = "override")

        # obtain the locator
        aw_namespace = cmds.namespaceInfo(listOnlyNamespaces=1)
        for i in aw_namespace:
            aw_nameSpans = i.split("_")
            if aw_nameSpans[-1] == "Rig":
                aw_name_fore = i
                break
        print(aw_name_fore)
        aw_name_key = aw_name_fore + ":*_locx"
        print(aw_name_key)
        cmds.select(aw_name_key)
        aw_locators = cmds.ls(selection=1)

        # obtain the controllers
        aw_controllers = []
        aw_join_sym = "_"
        for i in aw_locators:
            print(i)
            aw_splits = i.split("_")
            aw_ctl = aw_join_sym.join(aw_splits[:-1])
            print(aw_ctl)
            aw_tran_lock = cmds.getAttr(aw_ctl+ ".tx", lock=1)
            print(aw_tran_lock)
            if aw_tran_lock == 1:
                cmds.parentConstraint(i, aw_ctl, mo=0, st=["x", "y", "z"])
            else:
                cmds.parentConstraint(i, aw_ctl, mo=0)
            aw_controllers.append(aw_ctl)

        aw_time_range = self.get_time_range()

        self.bake_animations(aw_controllers, aw_time_range[0], aw_time_range[1])

        for i in aw_locators:
            cmds.delete(i)

