import sys
import os

from maya import standalone
standalone.initialize()

paths = [r'E:\Projects\TA', r'D:\p4ws\wlm_AC617_blue\tools\dcc\blue\externalPackages']
for path in paths:
    if path not in sys.path:
        sys.path.append(path)

from maya import cmds as mc
from blue.dcc.maya.core.referencing.msvReferenceUtils import get_scene_references

mayaFile = r'd:\p4ws\wlm_AC617_blue\source\blue\Animation\Character\Wildlife\Direhorse\Locomotion\Gallop\DIR_Gallop_Lt_01.ma'
# try:
mc.file(mayaFile, open=True, force=True)
# except:
#     pass
# for reference in get_scene_references():
#     reference.resolve()
#
# from blue.dcc.maya.core.msvAnimationRetarget import HIKCharacter, HIKSource, MetaRigDestination, MetaRigSource, BinderDestination
# from Red9.core.Red9_Meta import getMetaNodes
# from shared.dcc.maya.core.msvTime import get_current_time_range
#
#
# rig = None
# if getMetaNodes(mTypes='MsvMetaRig'):
#     meta_nodes = getMetaNodes(mTypes='MsvMetaRig')
#     for obj in meta_nodes:
#         if obj.rigName == 'Direhorse':
#             rig = obj
#
# source_mapping = MetaRigSource.create_from_meta_rig(rig)
# source_mapping.enable()
#
# destination_mapping = BinderDestination.create_from_file(r'D:/p4ws/wlm_AC617_blue/source/blue/Animation/Rigs/Wildlife/Direhorse/Binder/Direhorse_Binder.ma')
# destination_mapping.enable()
#
# MetaRigDestination.connect_mappings(source_mapping, destination_mapping)
#
# start, end = get_current_time_range()
# destination_mapping.bake_data(start=start, end=end)
import os
from maya import cmds as mc

file_name = mc.file(q=True, sceneName=True)

new_name = os.path.splitext(file_name)[0] + '_copy.ma'
mc.file(rename=new_name)
mc.file(save=True, type='mayaAscii')





