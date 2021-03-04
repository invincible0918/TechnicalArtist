import os
import sys
import pymel.core as pmc

from maya import cmds as mc
from blue.dcc.maya.core.referencing.msvReferenceUtils import get_scene_references
from blue.dcc.maya.core.referencing.msvReference import Reference
from blue.dcc.maya.core.msvAnimationExporter import RigLogicAnimData, bake_animation, export_to_fbx, EXPORT_FOLDER
from Red9.core.Red9_Meta import getMetaNodes

MAYABATCHOUTPUT = 'Maya Batch Output'
OPENMAYAFILE = 'Open Maya File'
EXPORTANIMATION = 'Export Animation'
EXPORFAIL = 'Export FAIL'


def open_maya(file_path):
    print '%s: %s: %s' % (MAYABATCHOUTPUT, OPENMAYAFILE, file_path)

    mc.file(force=True, new=True)
    try:
        mc.file(file_path, open=True, force=True)
    except Exception as e:
        print e.message

    for reference in get_scene_references():
        reference.resolve()


def save_maya(file_path):
    # 0777 removes the read-only property of files on my system
    os.chmod(file_path, 0777)
    mc.file(save=True, type='mayaAscii', options='v=0;', force=True)


def clean_skeleton(export_joints):
    # delete trash
    trash = []
    for obj in export_joints:
        children = mc.listRelatives(obj, children=True, fullPath=True) or []
        trash += [child for child in children if child not in export_joints]
    mc.delete(trash)

    # delete constraints
    mc.select(deselect=True)
    mc.delete(constraints=True)


def import_reference(file_path):
    def _recursive_import(ref):
        child_refs = ref.get_children_references()
        ref.import_()
        for child_ref in child_refs:
            _recursive_import(child_ref)

    references = mc.file(query=True, reference=True) or []
    for ref_path in references:
        try:
            _recursive_import(Reference(ref_path))
        except Exception as e:
            print '%s: %s: %s, Error Msg: Can not import reference, %s' % (MAYABATCHOUTPUT, EXPORFAIL, file_path, e.message)


def retarget_reference(meta_rig, reference_path):
    reference_node = meta_rig.referenceNode()
    old_namespace = mc.referenceQuery(reference_node, namespace=True)[1:]
    new_namespace = os.path.basename(reference_path).split('.')[0]
    mc.file(reference_path, loadReference=reference_node)
    mc.namespace(removeNamespace=new_namespace + ':', force=True, mergeNamespaceWithRoot=True)
    mc.namespace(rename=[old_namespace + ':', new_namespace], force=True)


def export_animation(file_path):
    meta_nodes = getMetaNodes(mTypes='MsvMetaRig')
    meta_rig = None
    joints = None
    if meta_nodes:
        for meta_node in meta_nodes:
            _joints = meta_node.get_export_joints()
            if _joints and meta_node.nameSpaceFull():
                meta_rig = meta_node
                joints = _joints

    if meta_rig:
        start_time = mc.playbackOptions(q=True, minTime=True)
        end_time = mc.playbackOptions(q=True, maxTime=True)
        export_name = os.path.basename(file_path).split(os.path.extsep)[0]

        try:
            import_reference(file_path)
            bake_animation(joints, start_time, end_time)
            clean_skeleton(joints)
            export_to_fbx(joints, start_time, end_time, export_name, export_folder=EXPORT_FOLDER)
            print '%s: %s: %s' % (MAYABATCHOUTPUT, EXPORTANIMATION, file_path)
        except Exception as e:
            print '%s: %s: %s, Error Msg: %s' % (MAYABATCHOUTPUT, EXPORFAIL, file_path, e.message)
    else:
        print '%s: %s: %s, Error Msg: Can not find meta rig!' % (MAYABATCHOUTPUT, EXPORFAIL, file_path)


def reference_animation(file_path, reference_path):
    meta_nodes = getMetaNodes(mTypes='MsvMetaRig')
    meta_rig = None
    if meta_nodes:
        meta_rig = meta_nodes[0]

    if meta_rig:
        try:
            retarget_reference(meta_rig, reference_path)
            print '%s: %s: %s' % (MAYABATCHOUTPUT, EXPORTANIMATION, file_path)
        except Exception as e:
            print '%s: %s: %s, Error Msg: %s' % (MAYABATCHOUTPUT, EXPORFAIL, file_path, e.message)
    else:
        print '%s: %s: %s, Error Msg: Can not find meta rig!' % (MAYABATCHOUTPUT, EXPORFAIL, file_path)
