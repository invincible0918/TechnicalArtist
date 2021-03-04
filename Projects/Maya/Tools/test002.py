#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 5/10/2019 4:19 PM
# @Author  : invincible0918@126.com
# @Site    : 
# @File    : test002.py
# @Software: PyCharm

import urpc

# services
consoleservice = urpc.get_service("snowdrop/Console")
assetservice = urpc.get_service("snowdrop/Assets")

# get the assets
assetmodule = assetservice.GetAssetModule()
TYPE_MODEL = 2  # see metadata for asset type enums
allassets = assetmodule.GetAssetsOfType(TYPE_MODEL)  # slow

consoleservice.Print("assets found:" + str(len(allassets)))

# print the first 5
for i in range(5):
    consoleservice.Print("--")
    consoleservice.Print(allassets[i].GetName())
    consoleservice.Print(allassets[i].GetTypeWithSubTypeString())
    consoleservice.Print(str(allassets[i].GetFilenames()))
    consoleservice.Print(allassets[i].GetMetadataFilePath())
    consoleservice.Print(allassets[i].GetVirtualPath(True))