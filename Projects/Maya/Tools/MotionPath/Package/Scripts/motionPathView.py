#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/12/18
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
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
