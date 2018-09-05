#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/3/24
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : baseGUI.py

from maya import mel as mm

VERSION = mm.eval('getApplicationVersionAsFloat()')

if VERSION >= 2017:
    from _baseGUI2 import BaseGUI as _BaseGUI
else:
    from _baseGUI import BaseGUI as _BaseGUI

BaseGUI = _BaseGUI
