#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/03/26
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : proceduralAnimModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from maya import cmds as mc
from maya.api import OpenMaya as om
from Core.IO.YAML import yamlIO
import keyframeData
reload(keyframeData)
from keyframeData import KeyframeData


class ProceduralAnimModel(Model):
    attr_dict = {'tx': ('outputX', 'translate.translateX'),
                 'ty': ('outputY', 'translate.translateY'),
                 'tz': ('outputZ', 'translate.translateZ'),
                 'rx': ('outputX', 'rotate.rotateX'),
                 'ry': ('outputY', 'rotate.rotateY'),
                 'rz': ('outputZ', 'rotate.rotateZ')}

    def lateInit(self, **kwargs):
        super(ProceduralAnimModel, self).lateInit(**kwargs)

        # load plugin
        if not mc.pluginInfo('mathSpring', q=True, loaded=True):
            plugin_path = os.path.join(os.environ['TATOOL'], r'Projects\Blue\Tools\MathUtilities\regisiter.py').replace('\\', '/')
            mc.loadPlugin(plugin_path)
            mc.pluginInfo(plugin_path, e=True, autoload=True)
        else:
            mc.unloadPlugin('mathSpring', f=True)

        # load all info
        self._sendMessage('keyframe_datas', self.get_keyframe_datas())

    def keyframe_data(self, obj, keyframe_data):
        """
        :param obj: node in maya
        :param keyframe_datas: KeyframeData list
        :return:
        """
        node_names = self.get_spring_nodes(obj)
        if not node_names:
            spring_node = mc.createNode('mathSpring')
            mc.connectAttr('time1.outTime', '%s.time' % spring_node, f=True)
            mc.setAttr('%s.source' % spring_node, obj, type='string')
        else:
            spring_node = node_names[0]

        keyframe_data_to_string = keyframe_data.to_string
        mc.setAttr('%s.keyframes[0]' % spring_node, keyframe_data_to_string, type='string')

        self.connect_attr(spring_node, obj, keyframe_data.rx, 'rx')
        self.connect_attr(spring_node, obj, keyframe_data.ry, 'ry')
        self.connect_attr(spring_node, obj, keyframe_data.rz, 'rz')

    def delete(self, obj):
        mc.delete(obj)

    def delete_all_keyframes(self):
        pass

    def load(self, path):
        if os.path.exists(path):
            data = yamlIO.read(path)
            for k, v in data.items():
                ins = KeyframeData(v)
                self.keyframe_data(k, ins)

            self._sendMessage('keyframe_datas', self.get_keyframe_datas())

    def save(self, path):
        di = self.get_keyframe_datas()

        data = dict()
        for k, v in di.iteritems():
            data[v] = mc.getAttr(k + '.keyframes[0]')

        yamlIO.write(path, data)

    def connect_attr(self, source, dest, attr, attr_name):
        source_attr = '%s.output.%s' % (source, self.attr_dict[attr_name][0])
        dest_attr = '%s.%s' % (dest, self.attr_dict[attr_name][1])

        if attr:
            try:
                mc.connectAttr(source_attr, dest_attr, f=True)
            except Exception as e:
                print e.message
        else:
            src = mc.connectionInfo(dest_attr, sfd=True)
            if src:
                mc.disconnectAttr(src, dest_attr)

    def get_spring_nodes(self, obj):
        """
        Find out obj's upstream nodes which are spring node
        :param obj:
        :return:
        """
        spring_nodes = list()
        li = om.MGlobal.getSelectionListByName(obj)
        depend_node = li.getDependNode(0)

        graph_node = om.MItDependencyGraph(depend_node,
                                           om.MItDependencyGraph.kUpstream,
                                           om.MItDependencyGraph.kPlugLevel)
        while not graph_node.isDone():
            current_node = graph_node.currentNode()
            if current_node.hasFn(om.MFn.kPluginDependNode):
                node = om.MFnDependencyNode(current_node)
                spring_nodes.append(node.name())
            graph_node.next()

        return spring_nodes

    def get_keyframe_datas(self):
        data = dict()

        for math_spring in mc.ls(type='mathSpring'):
            l = list()
            li = om.MGlobal.getSelectionListByName(math_spring)
            depend_node = li.getDependNode(0)

            graph_node = om.MItDependencyGraph(depend_node,
                                               om.MItDependencyGraph.kDownstream,
                                               om.MItDependencyGraph.kNodeLevel)
            while not graph_node.isDone():
                current_node = graph_node.currentNode()
                if current_node.hasFn(om.MFn.kTransform):
                    node = om.MFnDependencyNode(current_node)
                    l.append(node.name())
                graph_node.next()

            if l and l[0] not in data:
                data[math_spring] = l[0]

        return data


