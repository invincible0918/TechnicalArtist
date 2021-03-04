import os
from maya import cmds as mc

file_name = mc.file(q=True, sceneName=True)

new_name = os.path.splitext(file_name)[0] + '_copy.ma'
mc.file(rename=new_name)
mc.file(save=True, type='mayaAscii')
