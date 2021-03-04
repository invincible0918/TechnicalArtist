#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2019/07/25
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : batchRetargetModel.py

import os
from Core.MayaGUI.LitFrame.model import Model
from blue.dcc.maya.core.referencing.msvReferenceUtils import get_scene_references
from Red9.core.Red9_Meta import getMetaNodes
import Red9.core.Red9_Meta as r9Meta
import Red9.core.AnimationBinder as anim_binder
from maya import cmds as mc
from maya import OpenMaya as om


class BatchRetargetModel(Model):
    def lateInit(self, **kwargs):
        super(BatchRetargetModel, self).lateInit(**kwargs)

        # binder_file = r'd:\p4ws\wlm_AC617_blue\source\blue\Animation\Rigs\Wildlife\Thanator\Binder\Thanator_Binder.ma'
        # source_path = r'd:\p4ws\wlm_AC617_blue\source\blue\Animation\Rigs\Wildlife\Thanator\Retarget_Src'
        # dest_path = r'D:\p4ws\wlm_AC617_blue\source\blue\Animation\Rigs\Wildlife\Thanator\Retarget_Des'
        #
        # self.batch_retarget_in_maya(binder_file, source_path, dest_path)

    def batch_import_in_maya(self, binder_file, source_path, dest_path):
        binder_file = binder_file.replace('\\', '/')
        batch_files = self._get_animation_files(source_path)

        for i in range(len(batch_files)):
            animation_file = batch_files[i]

            # import animation and open binder file
            self._import_animation_file(animation_file, binder_file)

            # save file now
            new_path = os.path.join(dest_path, os.path.basename(animation_file).split('.')[0] + '.ma')
            mc.file(rename=new_path)
            mc.file(save=True, type='mayaAscii', options='v=0;', force=True)

    def batch_remove_in_maya(self, binder_file, source_path, dest_path):
        pass

    def batch_retarget_in_maya(self, binder_file, source_path, dest_path):
        binder_file = binder_file.replace('\\', '/')
        batch_files = self._get_animation_files(source_path)

        for i in range(len(batch_files)):
            animation_file = batch_files[i]

            # save file as copy
            new_path = self._pre_open_file(dest_path, animation_file)

            source_root_nodes = self._get_root_nodes()

            binder_namespace = os.path.splitext(os.path.basename(binder_file))[0]

            # open animation and import binder file
            self._open_animation_file(new_path, binder_file, binder_namespace)

            # scale the source animation
            self._scale_skeleton(binder_namespace)

            # bind skeleton and bake binder
            source_rig, dest_rig, source_ctrls = self._bake(binder_namespace)

            # unload useless nodes
            self._unload_useless_nodes(source_rig, dest_rig, binder_namespace, source_root_nodes)

            # save file now
            self._save_file()

            # the last step, remove name space
            self._remove_namespace(new_path, binder_namespace)

    @classmethod
    def _unload_plugin(cls, plugin_name):
        if mc.pluginInfo(plugin_name, q=True, loaded=True):
            mc.unloadPlugin(plugin_name, force=True)

    @classmethod
    def _pre_open_file(cls, dest_path, animation_file):
        try:
            mc.file(animation_file, open=True, force=True, prompt=False)
        except Exception as e:
            print e.message

        cls._unload_plugin('mtoa')
        cls._unload_plugin('VectorRender')

        # force save
        cube = mc.polyCube()
        mc.delete(cube)

        new_path = os.path.join(dest_path, os.path.basename(animation_file).split('.')[0] + '.ma')
        mc.file(rename=new_path)
        mc.file(save=True, type='mayaAscii', options='v=0;', force=True)

        return new_path

    @classmethod
    def _save_file(cls):
        mc.refresh(force=True)
        mc.file(save=True, type='mayaAscii', options='v=0;', force=True)

    @classmethod
    def _get_animation_files(cls, folder_path):
        batch_files = []
        for root, dirs, files in os.walk(folder_path):
            batch_files += [os.sep.join([root, file]).replace("\\", "/") for file in files if
                            (file.lower().endswith(".ma") or
                             file.lower().endswith(".mb") or
                             file.lower().endswith(".fbx")
                             ) and '_copy.' not in file.lower()]
        return batch_files

    @classmethod
    def _get_root_parent(cls, node):
        parent_node = mc.listRelatives(node, parent=True, fullPath=True)
        if parent_node:
            return cls._get_root_parent(parent_node)
        else:
            return node

    @classmethod
    def _bake(cls, namespace):
        source_rig = None
        dest_rig = None
        source_root = None
        meta_nodes = getMetaNodes(mTypes='MsvMetaRig')
        if meta_nodes:
            for obj in meta_nodes:
                # print 'obj rig: %s, rig: %s' % (obj.rigName, rig_name)
                # if obj.rigName == rig_name:
                if obj.nameSpaceFull().startswith(namespace):
                    dest_rig = obj
                else:
                    _source_rig = obj
                    _source_root = _source_rig.get_export_root()
                    if _source_root:
                        source_root = _source_root
                        source_rig = _source_rig

        if not source_root:
            root_name = dest_rig.get_export_root().split('|')[-1].split(':')[-1]
            for jnt in mc.ls(type='joint'):
                if not mc.reference(jnt, q=True, isNodeReferenced=True) and not jnt.startswith(namespace) and jnt.endswith(root_name):
                    source_root = jnt

        binder_rigs = r9Meta.getMetaNodes("MsvAnimationBinderRig")

        # source root (new rig) name is C_pelvis, Marker
        # but the dest root (old rig) name is root, marker, etc, so don't use name matching
        dest_root = [joint for joint in binder_rigs[0].get_root_joints()
                     if mc.listRelatives(joint, c=True, type='joint')][0]

        anim_binder.bind_skeletons(source_root, dest_root)

        dest_root_node = dest_rig.get_export_root()
        if mc.nodeType(dest_root_node) == 'reference':
            # We reference the skeleton into rig file
            # and the Meta rig node will store the reference node instead of the root joint
            # ps: the reference node is parent node of root joint
            joint_nodes = [node for node in mc.referenceQuery(dest_root_node, nodes=True, dp=True) if
                           mc.nodeType(node) == 'joint']
            joint_node = joint_nodes[0].split('|')[-1]
            dest_root_node = cls._get_root_parent(joint_node)
        else:
            # dest_root_node is u'|Thanator_Rig:main_Grp|Thanator_Rig:output_Grp|Thanator_Rig:C_pelvis'
            # always to select it's root parent node
            dest_root_node = dest_root_node.split('|')[1]

        ctrls = cls._get_bound_ctrls(dest_root_node)
        # anim_binder.bake_binder_data(dest_root_node)
        self._bake_binder_data()
        return source_rig, dest_rig, ctrls

    @classmethod
    def _get_bound_ctrls(cls, root_node=None):
        bound_ctrls = anim_binder.get_bound_controls(root_node)

        # Found no Ctrls, try and walk the message from the BndNodes
        if not bound_ctrls:
            BndNodes = anim_binder.get_bind_nodes()
            for node in BndNodes:
                cons = mc.listConnections('%s.%s' % (node, anim_binder.BNDNODE_MARKER))
                if cons:
                    bound_ctrls.append(mc.ls(cons[0], long=True)[0])
                else:
                    print('Nothing connected to %s.%s' % (node, anim_binder.BNDNODE_MARKER))

        return bound_ctrls

    @classmethod
    def _unload_reference(cls, rig):
        reference_node = rig.referenceNode()
        reference_path = rig.referencePath()

        if reference_node and mc.objExists(reference_node):
            om.MFileIO.unloadReferenceByNode(reference_node)

        if reference_path and os.path.exists(reference_path):
            om.MFileIO.removeReference(reference_path)

        mc.refresh(force=True)

    @classmethod
    def _checkout(cls, animation_file):
        # 0777 removes the read-only property of files on my system
        os.chmod(animation_file, 0777)

    @classmethod
    def _remove_unknown_nodes(cls, animation_file):
        """
        This function will open maya, save it, in this pc to make sure the mtoa.mll and vectorRender.mll are unloaded
        :param animation_file:
        :return:
        """
        try:
            mc.file(animation_file, open=True, force=True)
        except:
            mc.file(rename=animation_file)

        # force save
        cube = mc.polyCube()
        mc.delete(cube)

        mc.file(save=True, type='mayaAscii')

    @classmethod
    def _unload_useless_nodes(cls, source_rig, dest_rig, binder_namespace, source_root_nodes):
        if source_rig:
            # remove source reference
            source_namespace = source_rig.nameSpaceFull()
            cls._unload_reference(source_rig)
        else:
            root_name = dest_rig.get_export_root().split('|')[-1].split(':')[-1]
            for jnt in mc.ls(type='joint'):
                if not mc.reference(jnt, q=True, isNodeReferenced=True) and not jnt.startswith(
                        binder_namespace) and jnt.endswith(root_name):
                    source_namespace = jnt.split(':')[0]
                    for root in source_root_nodes:
                        if mc.objExists(root):
                            try:
                                mc.delete(root)
                            except Exception as e:
                                print e.message
                    break

        # remove the binder file's node and rename source namespace nodes
        nodes_with_namespace = [node for node in mc.ls(recursive=True)]
        for i in reversed(range(len(nodes_with_namespace))):
            node = nodes_with_namespace[i]

            if mc.objExists(node):
                if node.startswith(binder_namespace):
                    if mc.nodeType(node) == 'reference':
                        continue

                    try:
                        mc.lockNode(node, lock=False)
                        mc.delete(node)
                    except Exception as e:
                        print e.message

                elif node.startswith(source_namespace):
                    try:
                        mc.lockNode(node, lock=False)
                        mc.rename(node, node.replace(source_namespace + ':', source_namespace + '__'))
                    except Exception as e:
                        print e.message

    @classmethod
    def _import_animation_file(cls, animation_file, binder_file):
        """
        Open binder file and import source animation
        """
        mc.file(force=True, new=True)
        try:
            mc.file(binder_file, open=True, force=True)
        except Exception as e:
            print e.message
        finally:
            mc.file(animation_file, i=True, namespace=':')

    @classmethod
    def _open_animation_file(cls, animation_file, binder_file, namespace):
        """
        Open source animation and import binder file
        """
        mc.file(force=True, new=True)
        try:
            mc.file(animation_file, open=True, force=True)
        except Exception as e:
            print e.message
        finally:
            mc.file(binder_file, i=True, usingNamespaces=True, preserveReferences=True, namespace=namespace)
            for reference in get_scene_references():
                reference.resolve()

    @classmethod
    def _remove_namespace(cls, file_path, binder_namespace):
        # mc.file(new=True, force=True)
        #
        # mc.refresh(force=True)
        mc.file(file_path, open=True, force=True, prompt=False)
        try:
            mc.namespace(moveNamespace=[binder_namespace + ':', ':'], force=True)
        except Exception as e:
            print 'remove namespace fails: %s' % e.message
            # Currently if the rig file reference the bind file, it will raise an error
            # https://knowledge.autodesk.com/support/maya/troubleshooting/caas/sfdcarticles/sfdcarticles/Unable-to-remove-a-namespace-from-a-references-object.html
            # So, we need to do these steps
            # 1. Unload file reference
            rig = None

            meta_nodes = getMetaNodes(mTypes='MsvMetaRig')
            if meta_nodes:
                for obj in meta_nodes:
                    if obj.nameSpaceFull().startswith(binder_namespace):
                        rig = obj

            reference_node = rig.referenceNode()

            om.MFileIO.unloadReferenceByNode(reference_node)

            # 2. Remove namespace
            mc.namespace(moveNamespace=[binder_namespace + ':', ':'], force=True)

            # 3. Load reference again
            new_reference_node_name = reference_node.replace(binder_namespace + ':', '')
            om.MFileIO.loadReferenceByNode(new_reference_node_name)

        mc.file(save=True, type='mayaAscii', options='v=0;', force=True)

    @classmethod
    def _get_root_nodes(cls):
        nodes = [node for node in mc.ls(type='transform') if not mc.listRelatives(node, p=True) and
                 mc.getAttr(node+'.v')]
        return nodes

    @classmethod
    def _scale_skeleton(cls, binder_namespace):
        for jnt in mc.ls(type='joint'):
            if not jnt.startswith(binder_namespace) and jnt.endswith('C_pelvis'):
                source_root_joint = jnt
                break

        scale = (1.0, 1.0, 1.0)
        meta_nodes = getMetaNodes(mTypes='MsvAnimationBinderRig')
        if meta_nodes:
            for obj in meta_nodes:
                joint = obj.rootJoints[0].mNode

                scale = mc.getAttr(mc.listRelatives(joint, p=True)[0]+'.s')[0]
                break

        parent_grp = mc.listRelatives(source_root_joint, p=True)
        if parent_grp:
            parent_grp = parent_grp[0]
            # Be careful there is a link between this group and it's children joints
            # group.scale -> joint.inverseScale, we need to break it to let scale work
            dests = mc.connectionInfo('%s.scale' % parent_grp, destinationFromSource=True)
            for dest in dests:
                mc.disconnectAttr('%s.scale' % parent_grp, dest)
        else:
            parent_grp = mc.group(source_root_joint, n='output_Grp', w=True, r=True)
            mc.xform(parent_grp, os=True, pivots=(0, 0, 0))

        if scale != (1.0, 1.0, 1.0):
            mc.xform(parent_grp, s=scale, os=True)

    def bake_binder_data(rootNode=None, debugView=False, runFilter=True, ignoreInFilter=[]):
        '''
        From a given Root Node search all children for the 'BoundCtr' attr marker. If none
        were found then search for the BindNode attr and use the message links to walk to
        the matching Controller.
        Those found are then baked out and the marker attribute is deleted
        '''
        BoundCtrls = anim_binder.get_bound_controls(rootNode)

        # Found no Ctrls, try and walk the message from the BndNodes
        if not BoundCtrls:
            BndNodes = anim_binder.get_bind_nodes()
            for node in BndNodes:
                cons = cmds.listConnections('%s.%s' % (node, BNDNODE_MARKER))
                if cons:
                    BoundCtrls.append(cmds.ls(cons[0], l=True)[0])
                else:
                    log.info('Nothing connected to %s.%s' % (node, BNDNODE_MARKER))

        if BoundCtrls:
            try:
                if not debugView:
                    cmds.refresh(su=True)
                # with r9General.AnimationContext():
                    cmds.bakeResults(BoundCtrls, simulation=True,
                                     sampleBy=1,
                                     time=(
                                     cmds.playbackOptions(q=True, min=True), cmds.playbackOptions(q=True, max=True)),
                                     disableImplicitControl=True,
                                     preserveOutsideKeys=True,
                                     sparseAnimCurveBake=True,
                                     removeBakedAttributeFromLayer=False,
                                     controlPoints=False,
                                     shape=False)

                for node in BoundCtrls:
                    # Remove the BindMarker from the baked node
                    try:
                        cmds.deleteAttr('%s.%s' % (node, BAKE_MARKER))
                    except StandardError, error:
                        log.info(error)
                if ignoreInFilter:
                    BoundCtrls = [node for node in BoundCtrls if
                                  node.split('|')[-1].split(':')[-1] not in ignoreInFilter]
                if runFilter:
                    cmds.filterCurve(BoundCtrls)
                cmds.delete(BoundCtrls, sc=True)  # static channels
            except StandardError, error:
                raise StandardError(error)
            finally:
                cmds.refresh(su=False)
                cmds.refresh(f=True)
        else:
            raise StandardError("Couldn't find any BinderMarkers in given hierarchy")
        return True