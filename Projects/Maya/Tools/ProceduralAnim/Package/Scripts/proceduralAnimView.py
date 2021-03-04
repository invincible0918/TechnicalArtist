#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/03/26
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : proceduralAnimView.py


import os
from maya.api import OpenMaya as om
from Core.MayaGUI.LitFrame.view import View
from functools import partial
from maya import cmds as mc
import keyframeData
reload(keyframeData)
from keyframeData import KeyframeData


class KeyframeWidget(object):
    def __init__(self,
                 node_name,
                 controller_name,
                 load_widget_func,
                 parent,
                 msg_func):
        self._node_name = node_name
        self._controller_name = controller_name
        self._parent = parent
        self._msg_func = msg_func
        row = os.path.join(os.path.split(__file__)[0], '../GUI/row.ui')
        self._widget = load_widget_func(row, parent)

        self._widget.selectBTN.clicked.connect(self.select)
        self._widget.deleteBTN.clicked.connect(self.delete)
        self._widget.confirmBTN.clicked.connect(self.confirm)
        self._widget.pickBTN.clicked.connect(self.pick)

        # it should display the parent name
        if self._controller_name:
            parent_name = mc.listRelatives(self._controller_name, parent=True)[0]
            self._widget.targetLE.setText(parent_name)

    @property
    def widget(self):
        return self._widget

    def set_active(self, active):
        self._widget.setHidden(not active)

    def set_value(self, key, value):
        setattr(self, key, value)

    def delete(self):
        self.set_active(False)
        if mc.objExists(self._node_name):
            self._msg_func('delete', self._node_name)

    def select(self):
        objs = mc.ls(sl=True)
        if len(objs) == 1:
            self._widget.targetLE.setText(objs[0])

    def pick(self):
        objs = mc.ls(sl=True)
        if len(objs) == 1 and mc.objExists(objs[0]):
            self._widget.parentObjectLE.setText(objs[0])

    def confirm(self):
        # always set keyframe datas in child node
        child_node = self._get_child_node()
        if child_node:
            self._msg_func('keyframe_data', child_node, self.keyframe_data)

    @property
    def keyframe_data(self):
        keyframe_data = KeyframeData({'keyframe': float(self._widget.keyframeLE.text()),
                                      'delay': float(self._widget.delayLE.text()),
                                      'amplitude': float(self._widget.ampLE.text()),
                                      'cycle': float(self._widget.cycleLE.text()),
                                      'damping': float(self._widget.dampingLE.text()),
                                      'disturbance': om.MVector(float(self._widget.disturbanceXLE.text()),
                                                                float(self._widget.disturbanceYLE.text()),
                                                                float(self._widget.disturbanceZLE.text())),
                                      'gravity': om.MVector(float(self._widget.gravityXLE.text()),
                                                            float(self._widget.gravityYLE.text()),
                                                            float(self._widget.gravityZLE.text())),
                                      'follow': self._widget.followCB.isChecked(),
                                      'follow_delay': float(self._widget.followDelayLE.text()),
                                      'follow_amp': float(self._widget.followAmpLE.text()),
                                      'follow_object': self._widget.parentObjectLE.text(),
                                      'rx': self._widget.rxCB.isChecked(),
                                      'ry': self._widget.ryCB.isChecked(),
                                      'rz': self._widget.rzCB.isChecked(),
                                      'tx': self._widget.txCB.isChecked(),
                                      'ty': self._widget.tyCB.isChecked(),
                                      'tz': self._widget.tzCB.isChecked()
                                      })

        return keyframe_data

    @keyframe_data.setter
    def keyframe_data(self, value):
        ins = KeyframeData(value)

        self._widget.keyframeLE.setText(str(ins.keyframe))
        self._widget.delayLE.setText(str(ins.delay))
        self._widget.ampLE.setText(str(ins.amplitude))
        self._widget.cycleLE.setText(str(ins.cycle))
        self._widget.dampingLE.setText(str(ins.damping))
        self._widget.disturbanceXLE.setText(str(ins.disturbance.x))
        self._widget.disturbanceYLE.setText(str(ins.disturbance.y))
        self._widget.disturbanceZLE.setText(str(ins.disturbance.z))
        self._widget.gravityXLE.setText(str(ins.gravity.x))
        self._widget.gravityYLE.setText(str(ins.gravity.y))
        self._widget.gravityZLE.setText(str(ins.gravity.z))
        self._widget.followCB.setChecked(ins.follow)
        self._widget.followDelayLE.setText(str(ins.follow_delay))
        self._widget.followAmpLE.setText(str(ins.follow_amp))
        self._widget.parentObjectLE.setText(str(ins.follow_object))
        self._widget.rxCB.setChecked(ins.rx)
        self._widget.ryCB.setChecked(ins.ry)
        self._widget.rzCB.setChecked(ins.rz)
        self._widget.txCB.setChecked(ins.tx)
        self._widget.tyCB.setChecked(ins.ty)
        self._widget.tzCB.setChecked(ins.tz)

    def _get_child_node(self):
        node = self._widget.targetLE.text()
        if mc.objExists(node):
            child_node = mc.listRelatives(node, c=True, type='transform')
            if child_node:
                return child_node[0]
        return None


class ProceduralAnimView(View):
    def __init__(self):
        # before create ui, it need to load custom widget first
        from Core.MayaGUI.CustomWidget.dndLineEdit import DNDLineEdit
        self._registerCustomWidget(DNDLineEdit)

        super(ProceduralAnimView, self).__init__()

    @property
    def _uiFile(self):
        return os.path.join(os.path.split(__file__)[0], '../GUI/dialog.ui')

    def _initGUI(self):
        self.keyframe_data_widgets = list()

    def _bindMethod(self):
        def open():
            path = mc.file(q=True, sn=True).replace('.ma', '.yaml')
            if os.path.exists(path):
                os.startfile(os.path.dirname(path))

        self._ui.addBTN.clicked.connect(self.add)
        self._ui.deleteAllBTN.clicked.connect(self.delete_all)
        self._ui.saveBTN.clicked.connect(self.save)
        self._ui.loadBTN.clicked.connect(self.load)

        path = mc.file(q=True, sn=True).replace('.ma', '.yaml')
        if os.path.exists(path):
            msg = '%s exists!' % path
        else:
            msg = 'Can not find yaml file!'

    def add(self):
        widget = KeyframeWidget('', '', self._loadUiWidget, self._ui, self._sendMessage)
        self._ui.keyframeDataVBL.addWidget(widget.widget)
        self.keyframe_data_widgets.append(widget)

    def delete_all(self):
        for widget in self.keyframe_data_widgets:
            widget.set_active(False)
        self._sendMessage('delete_all_keyframes', self._ui.objectLE.text())

    def save(self):
        path = self._ui.saveLE.text()
        if os.path.exists(path):
            self._sendMessage('save', path)

    def load(self):
        path = self._ui.loadLE.text()
        if os.path.exists(path):
            self._sendMessage('load', path)

    def keyframe_datas(self, data):
        # remove previous widget
        for widget in self.keyframe_data_widgets:
            widget.set_active(False)

        for k, v in data.items():
            # add new
            widget = KeyframeWidget(k, v, self._loadUiWidget, self._ui, self._sendMessage)
            widget.keyframe_data = mc.getAttr(k + '.keyframes[0]')
            self._ui.keyframeDataVBL.addWidget(widget.widget)
            self.keyframe_data_widgets.append(widget)