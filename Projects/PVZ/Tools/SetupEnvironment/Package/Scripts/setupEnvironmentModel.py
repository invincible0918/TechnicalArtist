#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/04/18
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : setupEnvironmentModel.py

import os
import socket
from Core.MayaGUI.LitFrame.model import Model
from Core.IO.YAML import yamlIO
from Core.MayaGUI import dialog
from Common.Tools.VersionControlWrapper import interface
from Common.Tools.LocalFileSystem import main


class SetupEnvironmentModel(Model):
    def lateInit(self):
        # load config
        self._configPath = main.getFile('pvz/config.yaml')
        if os.path.exists(self._configPath):
            self._config = yamlIO.read(self._configPath)
            self._sendMessage('config', self._config)
        else:
            self._config = dict()

        # load branch
        self.__branchPath = main.getFile('pvz/branch.yaml')
        if os.path.exists(self.__branchPath):
            self.__branchData = yamlIO.read(self.__branchPath)
            self._sendMessage('branchPath', self.__branchData)
        else:
            self.__branchData = dict()

    @staticmethod
    def getUserInfoInterface(name, password):
        info = interface.parseArgs(**{'user': name,
                                      'password': password,
                                      'getInfo': '',
                                      'port': 'eamc-perforce.eamobile.ad.ea.com:1666'})
        branchData = dict()
        if info:
            # get host
            host = socket.getfqdn(socket.gethostname()).split('.')[0]

            allClients = info['allClients']
            for c in allClients:
                if c['Owner'] != name or c['Host'] != host:
                    continue

                # if 'Stream' in c and c['Stream'] in self.__depots:
                if 'Stream' in c and os.path.exists(c['Root']):
                    di = dict()
                    di['workspace'] = c['Root']
                    di['checked'] = False
                    branchData[c['Stream']] = di

            return branchData, info['password']
        else:
            return None, None

    def userInfo(self, name, password):
        branchData, encryptPassword = SetupEnvironmentModel.getUserInfoInterface(name, password)
        if branchData:
            self._config['user'] = name
            self._config['password'] = password
            yamlIO.write(self._configPath, self._config)

            self.__branchData = branchData
            yamlIO.write(self.__branchPath, self.__branchData)

            # refresh view data
            self._sendMessage('branchPath', self.__branchData)
        else:
            gui = dialog.ConfirmDialog2(**{'message': 'Can\'t get client info, please try again.'})
            gui.show()
