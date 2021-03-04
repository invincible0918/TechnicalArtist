from maya import cmds as mc
from blue.dcc.maya.core.referencing.msvReferenceUtils import get_scene_references

mc.file('{animation_file}', open=True, force=True)

for reference in get_scene_references():
    reference.resolve()

