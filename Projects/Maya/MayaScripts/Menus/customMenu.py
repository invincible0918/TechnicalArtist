#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2018/4/16
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : customMenu.py

import os
import sys
from maya import cmds as mc
from maya import mel as mm
from functools import partial


CUSTOMMENU = ''
PROJECTNAME = 'Blue'


def __bakeKeyframe(*args):
    pass
    # from Projects.PVZ.Tools.BakeKeyframe.Package.Scripts import bakeKeyframeModel
    # instance = bakeKeyframeModel.BakeKeyframeModel()
    # instance.bake()


def __setupEnvironment(*args):
    pass
    # import Projects.PVZ.Tools.SetupEnvironment.Package.main as main
    # main.run()


def __cleanCache(*args):
    pass
    # import Projects.PVZ.Tools.CleanCache.Package.main as main
    # main.run()


def __exporter(*args):
    pass
    # import Projects.PVZ.Tools.Exporter.Package.main as main
    # main.run()


def __createReference(*args):
    pass
    # import Projects.PVZ.Tools.CreateReference.Package.main as main
    # main.run()


def __createLocatorConstraint(*args):
    import Projects.Blue.Tools.LocatorConstraint.Package.main as main
    main.run()


def __batchRetarget(*args):
    import Projects.Blue.Tools.BatchRetarget.Package.main as main
    main.run()


def __exportAnimation(*args):
    import Projects.Blue.Tools.Exporter.Package.main as main
    main.run()


def __proceduralAnimation(*args):
    import Projects.Blue.Tools.ProceduralAnim.Package.main as main
    main.run()


def __openConfigPath(*args):
    pass
    # import Projects.PVZ.Tools.OpenConfigPath.Package.main as main
    # main.run()


def __ragdollTool(*args):
    import Projects.Blue.Tools.RagdollTool.Package.main as main
    main.run()


def __checkSkinInfluences(*args):
    import Projects.Blue.Tools.MsvCheckSkinInfluences.msv_Check_Skin_Influences as msv_Check_Skin_Influences
    msv_Check_Skin_Influences.main()


def __ucheck_tool(*args):
    from shared.MSVLib.msvTools import msvP4
    projectroot = msvP4.get_root()
    qt_path = os.path.join(projectroot, r'tools\dcc\blue\externalExecutables\Ucheck_app\__py27_venv\Lib\site-packages')

    sys.modules.pop('Qt', None)
    sys.path.insert(0, qt_path)
    import Qt

    try:
        reload(ucheck_special_launcher)
    except:
        import ucheck_special_launcher

    del sys.path[0]
    sys.modules.pop('Qt', None)


def __updateBindFile(*args):
    import Projects.Blue.Tools.RefreshBindFile.Package.main as main
    main.run()


def __customRigTool(*args):
    import Projects.Blue.Tools.CustomRig.Package.main as main
    main.run()


def __generateHitBox(*args):
    import Projects.Blue.Tools.GenerateHitBox.Package.main as main
    main.run()


def __setupLeg(*args):
    import Projects.Blue.Tools.LegSetup.Package.main as main
    main.run()


def __prefMarker(*args):
    import Projects.Blue.Tools.PrefMarker.Package.main as main
    main.run()


def __alignObject(*args):
    import Projects.Blue.Tools.AlignObject.Package.main as main
    main.run()


def __mirrorPose(*args):
    import Projects.Blue.Tools.MirrorAnim.Package.main as main
    main.run()


def createMenu(CUSTOMMENU):
    menus = mc.lsUI(menus=True)
    for i in range(len(menus)-1, -1, -1):
        menu = menus[i]
        if mc.menu(menu, q=True, label=True) == PROJECTNAME:
            mc.deleteUI(menu, menu=True)

    mainWindow = mm.eval('$null = $gMainWindow')
    mc.menu(p=mainWindow, to=True, l=PROJECTNAME)

    # main menu
    mc.menuItem(subMenu=True, l='Animation Tool', to=True)
    # mc.menuItem(l='Bake Keyframe', c=__bakeKeyframe)
    mc.menuItem(l='Create Reference', c=__createReference)
    mc.menuItem(l='Create Locator Constraint', c=__createLocatorConstraint)
    mc.menuItem(l='Batch Retarget', c=__batchRetarget)
    mc.menuItem(l='Export Animation', c=__exportAnimation)
    mc.menuItem(l='Procedural Animation', c=__proceduralAnimation)
    mc.menuItem(l='Align Object', c=__alignObject)
    mc.menuItem(l='Mirror Pose', c=__mirrorPose)
    mc.setParent('..', menu=True)
    mc.menuItem(d=True)
    # --------------------------------

    mc.menuItem(subMenu=True, l='Rig Tool', to=True)
    mc.menuItem(l='Update Bind File', c=__updateBindFile)
    mc.menuItem(l='Custom Rig Tool', c=__customRigTool)
    mc.menuItem(l='Generate Hit Box Model', c=__generateHitBox)
    mc.menuItem(l='Setup Leg', c=__setupLeg)
    mc.menuItem(l='Import Marker Preset', c=__prefMarker)
    mc.setParent('..', menu=True)
    mc.menuItem(d=True)
    # --------------------------------

    mc.menuItem(subMenu=True, l='Validation Tool', to=True)
    mc.menuItem(l='Check Skin Influences', c=__checkSkinInfluences)
    mc.setParent('..', menu=True)
    mc.menuItem(d=True)
    # --------------------------------

    # mc.menuItem(subMenu=True, l='Export Tool', to=True)
    # mc.menuItem(l='Export 2 Unity', c=__exporter)
    # mc.setParent('..', menu=True)
    # mc.menuItem(d=True)
    # # --------------------------------

    mc.menuItem(subMenu=True, l='Ucheck Tool', to=True)
    mc.menuItem(l='Ucheck Tool', c=__ucheck_tool)
    mc.setParent('..', menu=True)
    mc.menuItem(d=True)
    # --------------------------------

    mc.menuItem(subMenu=True, l='Common Tool', to=True)
    mc.menuItem(l='Setup Environment', c=__setupEnvironment)
    mc.menuItem(l='Open Config Path', c=__openConfigPath)
    mc.menuItem(l='Ragdoll Tool', c=__ragdollTool)
    mc.setParent('..', menu=True)

createMenu(CUSTOMMENU)
