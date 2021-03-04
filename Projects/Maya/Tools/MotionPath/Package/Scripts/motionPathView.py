#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/18
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : motionPathView.py


from Core.MayaGUI.LitFrame.view import View
import motionPathGUI
reload(motionPathGUI)


class MotionPathView(View):
    @property
    def _uiFile(self):
        return ''
        # return os.path.join(os.path.split(__file__)[0], '../GUI/dialog.ui')

    def _initGUI(self):
        motionPathGUI.run()

    def _bindMethod(self):
        pass
