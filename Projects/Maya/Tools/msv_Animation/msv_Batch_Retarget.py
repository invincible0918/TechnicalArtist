import os
from shared.MSVLib.msvGui.msvGuiUtils import get_main_window
# from blue.dcc.maya.core.batch.msvMayaBatch import BatchManagerMaya
# from blue.MSVLib.msvBatch import BatchTaskBase
from msv_Base_DockWidget import BaseDockWidgetView, BaseDockWidgetModel
from PySide2.QtWidgets import QLineEdit, QFileDialog
from functools import partial
from blue.dcc.maya.core.referencing.msvReferenceUtils import get_scene_references
from shared.dcc.maya.core.msvTime import get_current_time_range
from Red9.core.Red9_Meta import getMetaNodes
import Red9.core.Red9_Meta as r9Meta
import Red9.core.AnimationBinder as anim_binder
import blue.dcc.maya.core.referencing.msvReferenceRedirector as refRedir

from maya import cmds as mc
from maya import OpenMaya as om


class BatchRetargetModel(BaseDockWidgetModel):
    def batch_retarget_in_maya(self, binder_file, source_path, dest_path):
        binder_file = binder_file.replace('\\', '/')
        batch_files = self._get_animation_files(source_path)

        for i in range(len(batch_files)):
            animation_file = batch_files[i]

            # save file as copy
            new_path = self._pre_open_file(dest_path, animation_file)

            binder_namespace = os.path.splitext(os.path.basename(binder_file))[0]

            # open animation and import binder file
            self._open_animation_file(new_path, binder_file, binder_namespace)

            # bind skeleton and bake binder
            source_rig, dest_rig, source_ctrls = self._bake(binder_file, binder_namespace)

            # unload useless nodes
            self._unload_useless_nodes(source_rig, dest_rig, source_ctrls, binder_namespace)

            # save file now
            self._save_file()

            # the last step, remove name space
            self._remove_namespace(new_path, binder_namespace)

    def batch_retarget(self, binder_file, folder_path):
        """
        Log saves here: C:\Users\user\AppData\Local\Temp\MayaPyBatchServer
        :return:
        """
        def finish_progress():
            self._view_instance.ui.progressBar.setValue(100)

        def add_progress(value_to_add):
            self._view_instance.ui.progressBar.setValue(self._view_instance.ui.progressBar.value() + value_to_add)

        # binder_file = binder_file.replace('\\', '/')
        # batch_files = self._get_animation_files(folder_path)
        # main_window = get_main_window()
        # batch_manager = BatchManagerMaya(main_window)
        # batch_manager.finished.connect(finish_progress)
        #
        # task_folder = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'msv_Batch_Retarget_Src')
        # steps = 100 / len(batch_files)
        # for i in range(len(batch_files)):
        #     animation_file = batch_files[i]
        #
        #     batch_task = BatchTaskBase()
        #
        #     # open animation file
        #     open_source_task = os.path.join(task_folder, 'open_source.py')
        #     with open(open_source_task, 'r') as f:
        #         script = f.read().format(animation_file=animation_file)
        #         batch_task.add_block(script, 8)
        #
        #     # retarget
        #     retarget_task = os.path.join(task_folder, 'retarget.py')
        #     with open(retarget_task, 'r') as f:
        #         rig_name = os.path.splitext(os.path.basename(binder_file))[0].split('_')[0]
        #         script = f.read().format(rig_name=rig_name, binder_file=binder_file)
        #         batch_task.add_block(script, 56)
        #
        #     # save
        #     save_file_task = os.path.join(task_folder, 'save_file.py')
        #     with open(save_file_task, 'r') as f:
        #         script = f.read()
        #         batch_task.add_block(script, 100)
        #
        #     batch_manager.add_task(batch_task)
        #     batch_task.task_finished.connect(partial(add_progress, steps))
        #
        # batch_manager.start()

    @classmethod
    def _unload_plugin(cls, plugin_name):
        if mc.pluginInfo(plugin_name, q=True, loaded=True):
            mc.unloadPlugin(plugin_name, force=True)

    @classmethod
    def _pre_open_file(cls, dest_path, animation_file):
        try:
            mc.file(animation_file, open=True, force=True, prompt=False)
        except:
            pass

        cls._unload_plugin('mtoa')
        cls._unload_plugin('VectorRender')

        # force save
        cube = mc.polyCube()
        mc.delete(cube)

        new_path = os.path.join(dest_path, os.path.basename(animation_file))
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
                            (file.lower().endswith(".ma") or file.lower().endswith(".mb")) and '_copy.' not in file.lower()]
        return batch_files

    @classmethod
    def _get_root_parent(cls, node):
        parent_node = mc.listRelatives(node, parent=True, fullPath=True)
        if parent_node:
            return cls._get_root_parent(parent_node)
        else:
            return node

    @classmethod
    def _bake(cls, binder_file, namespace):
        rig_name = os.path.splitext(os.path.basename(binder_file))[0].split('_')[0]
        source_rig = None
        dest_rig = None
        meta_nodes = getMetaNodes(mTypes='MsvMetaRig')
        if meta_nodes:
            for obj in meta_nodes:
                # print 'obj rig: %s, rig: %s' % (obj.rigName, rig_name)
                # if obj.rigName == rig_name:
                if obj.nameSpaceFull().startswith(namespace):
                    dest_rig = obj
                else:
                    source_rig = obj

        source_root = source_rig.get_export_root()
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
        anim_binder.bake_binder_data(dest_root_node)

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

        print '#' * 100
        print 'Open: %s' % animation_file
        print '#' * 100
        # force save
        cube = mc.polyCube()
        mc.delete(cube)

        mc.file(save=True, type='mayaAscii')

    @classmethod
    def _unload_useless_nodes(cls, source_rig, dest_rig, source_ctrls, binder_namespace):
        source_namespace = source_rig.nameSpaceFull()
        # rig_file_path = dest_rig.referencePath()

        # remove source reference
        cls._unload_reference(source_rig)

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
                    except:
                        pass
                elif node.startswith(source_namespace):
                    try:
                        mc.lockNode(node, lock=False)
                        mc.rename(node, node.replace(source_namespace+':', source_namespace+'__'))
                    except:
                        pass

    @classmethod
    def _open_animation_file(cls, animation_file, binder_file, namespace):
        mc.file(force=True, new=True)
        try:
            mc.file(animation_file, open=True, force=True)
        except:
            pass
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


class DNDLineEdit(QLineEdit):
    def __init__(self, parent):
        super(DNDLineEdit, self).__init__(parent)
        self.setAcceptDrops(True)

    def dragEnterEvent(self, e):
        e.accept()

    def dropEvent(self, *args):
        pass
        # e.accept()


class BatchRetargetView(BaseDockWidgetView):
    NAME = "BATCH RETARGET"

    def __init__(self, parent):
        self.register_custom_widget(DNDLineEdit)
        super(BatchRetargetView, self).__init__(parent)

    @property
    def ui_path(self):
        return 'msv_Batch_Retarget_Src/batch_Retarget.ui'

    def _bind_methods(self):
        def refresh(path, line_edit):
            line_edit.setText(path)

        def browse_folder(line_edit):
            refresh(QFileDialog.getExistingDirectory(), line_edit)

        def browse_file():
            refresh(QFileDialog.getOpenFileName()[0], self._ui.binderPathLE)

        def receive(*args):
            line_edit = args[0]
            evt = args[1]
            if evt.mimeData().urls():
                refresh(evt.mimeData().urls()[0].path()[1:], line_edit)

        def batch_retarget():
            binder_file = self._ui.binderPathLE.text()
            source_folder_path = self._ui.sourceFolderLE.text()
            dest_folder_path = self._ui.destFolderLE.text()
            if os.path.exists(binder_file) and \
                    os.path.isfile(binder_file) and \
                    os.path.exists(source_folder_path) and \
                    os.path.isdir(source_folder_path) and \
                    os.path.exists(dest_folder_path) and \
                    os.path.isdir(dest_folder_path):
                # self._send_message('batch_retarget', binder_file, folder)
                self._send_message('batch_retarget_in_maya', binder_file, source_folder_path, dest_folder_path)

        self._ui.binderBTN.clicked.connect(browse_file)
        self._ui.binderPathLE.dropEvent = partial(receive, self._ui.binderPathLE)

        self._ui.sourceBrowserBTN.clicked.connect(partial(browse_folder, self._ui.sourceFolderLE))
        self._ui.sourceFolderLE.dropEvent = partial(receive, self._ui.sourceFolderLE)

        self._ui.destBrowserBTN.clicked.connect(partial(browse_folder, self._ui.destFolderLE))
        self._ui.destFolderLE.dropEvent = partial(receive, self._ui.destFolderLE)

        self._ui.batchRetargetBTN.clicked.connect(batch_retarget)

    def _create_model_instance(self):
        self._model_instance = BatchRetargetModel(self)

    def update_progress_bar(self, value):
        self._ui.progressBar.setValue(value)

    def operation_on(self, value):
        self._ui.mayaLB.setText(value)

def main():
    """
    Use this to debug
    import msv_Batch_Retarget
    reload(msv_Batch_Retarget)

    msv_Batch_Retarget.main()
    :return:
    """
    maya_main_window = get_main_window()
    for child in maya_main_window.children():
        if child.__class__.__name__ == 'BatchRetargetView':
            child.close()
            break

    # ui = BatchRetargetView(maya_main_window)
    # ui.show()

    binder_file = r'D:\p4ws\wlm_AC617_blue\source\blue\Animation\Rigs\Wildlife\Viperwolf\Binder/Viperwolf_Binder.ma'
    source_path = r'D:\p4ws\wlm_AC617_blue\source\blue\Animation\Character\Wildlife\ViperWolf\Jump'
    dest_path = r'D:\p4ws\wlm_AC617_blue\source\blue\Animation\Character\Wildlife\ViperWolf\jump_dest'

    _model_instance = BatchRetargetModel(None)
    _model_instance.batch_retarget_in_maya(binder_file, source_path, dest_path)

