#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/7/11
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : exportTexturesModel.py


from Core.MayaGUI.LitFrame.model import Model
from maya import cmds as mc
import os


class ReplaceNodeModel(Model):
    __nodes = []

    def __getNode(self, node):
        self.__nodes.append(node)
        childrenNode = mc.listRelatives(node, c=True, f=True)
        if childrenNode:
            for childNode in childrenNode:
                self.__getNode(childNode)

    def __replaceNode(self, sourceString, destString):
        self.__nodes = []

        nodes = mc.ls(sl=True)
        for node in nodes:
            self.__getNode(node)

        for node in self.__nodes:
            name = node.split('|')[-1]
            if sourceString in name:
                newName = name.replace(sourceString, destString)
                try:
                    mc.rename(node, newName)
                except:
                    print 'Can\'t rename this node %s' % node

    def __isIterReplaceNode(self, sourceString):
        self.__nodes = []

        nodes = mc.ls(sl=True)
        for node in nodes:
            self.__getNode(node)

        for node in self.__nodes:
            if sourceString in node:
                return True

        return False

    # public
    def doIt(self, sourceString, destString):

        while self.__isIterReplaceNode(sourceString):
            self.__replaceNode(sourceString, destString)
