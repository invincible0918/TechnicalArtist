"""
---------------------------------
Massive Annecy - Check Skin Influences
---------------------------------

"""
__author__ = 'marc.robert'
#TODO: merge with skinning modules ?

import codecs
import os

import pymel.all as pmc

from shared.MSVLib.msvGui import msvGuiUtils
from shared.MSVLib.msvGui.Qt import QtCore, QtGui, QtWidgets


tool_path = os.path.dirname(__file__)
tool_filename = os.path.basename(__file__)
ui_filename = tool_filename.split('.')[0]
resolved_ui_file = "%s/%s.ui" % (tool_path, ui_filename)

base_class, form_class = msvGuiUtils.loadUiType(resolved_ui_file)


class CheckSkin(form_class, base_class):
    def __init__(self, parent=msvGuiUtils.get_main_window()):
        super(CheckSkin, self).__init__(parent)
        self.setupUi(self)
        self.setAttribute(QtCore.Qt.WA_DeleteOnClose, True)
        self.check_btn.clicked.connect(self.check_button_press)
        self.prune_chk.stateChanged.connect(self.toggleTreshold)

    def findSkinCluster(self, mesh):
        skincluster = None
        for each in pmc.listHistory(mesh):
            if isinstance(each, pmc.nodetypes.SkinCluster):
                skincluster = each
        return skincluster

    def createReport(self, results):
        report = "GOT SOME Bad SKINNING IN:\n"
        tool_path = os.path.dirname(__file__)
        filePath = tool_path + "/SkinReport_.txt"
        absfilePath = os.path.abspath(filePath)
        reportFile = codecs.open(absfilePath, 'w', 'utf-8')
        for result in results:
            meshName = result[0]
            verticesIDs = result[1]
            report += ".Mesh: " + meshName + "\n"
            for vertexID in verticesIDs:
                report += "    vID: " + str(vertexID) + "\n"
            reportFile.write(report)
            reportFile.close()
        # print report
        msgBox = QtWidgets.QMessageBox()
        msgBox.setTextFormat(QtCore.Qt.RichText)
        msgBox.setText("Report available in: <a href='file:///" + filePath + "'>LINK</a>")
        msgBox.exec_()

    def checkSkin(self, mesh, maxInfluences=4):
        v = pmc.polyEvaluate(mesh, v=1)
        sc = self.findSkinCluster(mesh)
        # loop through vertices
        result = []
        select = self.select_chk.isChecked()
        prune = self.prune_chk.isChecked()
        for vtx in range(0, v):
            # get weights
            objVtx = mesh + ".vtx[" + str(vtx) + "]"
            values = pmc.skinPercent(sc, objVtx, q=1, v=1)
            if len(filter(lambda a: a != 0.0,
                          values)) > maxInfluences:  # Filter weights to remove 0.0 weights. The remaining arrays is the actual number of weights
                result.append(vtx)
                if select:
                    pmc.select(objVtx, add=True)
                if prune:
                    pmc.skinPercent(sc, objVtx, prw=self.pruneTreshold_spn.value())
        return result

    def toggleTreshold(self, *args):
        self.pruneTreshold_spn.setEnabled(self.prune_chk.isChecked())

    def openComponentEditor(self):
        import maya.mel
        maya.mel.eval('componentEditorWindow()')
        # Result: u'componentEditorWinComponEditor' #
        pmc.componentEditor('componentEditorWinComponEditor', q=True, ctl=True)
        # Result: u'componentEditorWin|compEdMenLayout|compEdForm|compEdFrame|formLayout52|componentEditorWinComponEditor' #

    def check_button_press(self, *args):
        meshes = pmc.ls(sl=True)  # get Selected meshes
        result = []
        for mesh in meshes:
            badVertices = self.checkSkin(mesh, self.maxInf_spn.value())
            if len(badVertices) > 0:
                result.append([mesh.name(), badVertices])
        if len(result) > 0:
            self.createReport(result)
            # componentEditorWindow is a MEL procedure so need to call through MEL.
            if self.select_chk.isChecked():
                self.openComponentEditor()
        else:
            msgBox = QtWidgets.QMessageBox()
            msgBox.setText("It's all good mate!")
            msgBox.exec_()


#===========================================================================
# MAIN
#===========================================================================
def main():
    msvGuiUtils.close_window(CheckSkin)
    CheckSkin().show()


# main()
