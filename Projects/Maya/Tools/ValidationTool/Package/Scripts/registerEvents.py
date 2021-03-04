#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 7/11/2018
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : registerEvents.py


from Projects.Blue.Tools.ValidationTool.Package.Scripts.Validation.validationRig import ValidationRig
from Projects.Blue.Tools.ValidationTool.Package.Scripts.Validation.validationAnimation import ValidationAnimation
from Projects.Blue.Tools.Simfk.Package.Scripts.simfkModel import SimfkModel
import maya.OpenMaya as om


EVENTSTRINGDICT = {'BeforeSave': om.MSceneMessage.kBeforeSave,
                   'AfterOpen': om.MSceneMessage.kAfterOpen}


def register_event(event_string, function):
    if event_string in EVENTSTRINGDICT:
        om.MSceneMessage.addCallback(EVENTSTRINGDICT[event_string], function)
        print '\n\t Register function "%s" at "%s" event\n' % (function, event_string)
    else:
        print '\n\t Can not find event "%s" when register function "%s"\n' % (event_string, function)


# before save or save as callback
register_event('AfterOpen', ValidationRig().validation)
register_event('AfterOpen', ValidationAnimation().validation)
register_event('AfterOpen', SimfkModel().attribute_changed_callback)


