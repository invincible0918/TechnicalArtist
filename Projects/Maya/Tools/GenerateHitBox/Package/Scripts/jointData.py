from maya import cmds as mc
from maya import mel as mm
from maya import OpenMaya as om
import obb
reload(obb)
import math


class JointData(object):
    BodyPartUID = {'WildlifeWeakPoint2.0Head': '#bfa75dff5a12d417000167973b3aacc2',
                   'WildlifeHide1.0UpperBody': '#bfa75dff5a12f360000167895dba3a13',
                   'WildlifeHide1.0LowerBody': '#7b254ee25a79cd9c0002c572e0ea04ed'}

    MaterialUID = {'Flesh': '#84b8ef744ffe8dac000000023707b9d4',
                   'FleshWeakpoint': '#5b1af62c5be992aa00138fbffebf8a89'}

    JointDict = {'pelvis': {'JointChain': ['pelvis', 'spine_01', 'spine_02', 'spine_03'],
                            'BodyPartUID': 'WildlifeHide1.0UpperBody',
                            'MaterialUID': 'Flesh'},
                 'tail_01': {'JointChain': ['tail_01', 'tail_02', 'tail_03'],
                             'BodyPartUID': 'WildlifeHide1.0UpperBody',
                             'MaterialUID': 'Flesh'},
                 'tail_04': {'JointChain': ['tail_04', 'tail_05', 'tail_06'],
                             'BodyPartUID': 'WildlifeHide1.0UpperBody',
                             'MaterialUID': 'Flesh'},
                 'tail_07': {'JointChain': ['tail_07', 'tail_08', 'tail_09'],
                             'BodyPartUID': 'WildlifeHide1.0UpperBody',
                             'MaterialUID': 'Flesh'},
                 'tail_10': {'JointChain': ['tail_10', 'tail_11', 'tail_12'],
                             'BodyPartUID': 'WildlifeHide1.0UpperBody',
                             'MaterialUID': 'Flesh'},
                 'tail_13': {'JointChain': ['tail_13', 'tail_14', 'tail_15'],
                             'BodyPartUID': 'WildlifeHide1.0UpperBody',
                             'MaterialUID': 'Flesh'},
                 'tail_16': {'JointChain': ['tail_16', 'tail_17', 'tail_18'],
                             'BodyPartUID': 'WildlifeHide1.0UpperBody',
                             'MaterialUID': 'Flesh'},
                 'spine_03': {'JointChain': ['spine_03', 'spine_04', 'spine_05'],
                              'BodyPartUID': 'WildlifeHide1.0UpperBody',
                              'MaterialUID': 'Flesh'},
                 'spine_05': {'JointChain': ['spine_05', 'neck_01'],
                              'BodyPartUID': 'WildlifeHide1.0UpperBody',
                              'MaterialUID': 'Flesh'},
                 'neck_01': {'JointChain': ['neck_01', 'neck_02', 'neck_03'],
                             'BodyPartUID': 'WildlifeHide1.0UpperBody',
                             'MaterialUID': 'Flesh'},
                 'neck_04': {'JointChain': ['neck_04', 'neck_05', 'neck_06'],
                             'BodyPartUID': 'WildlifeHide1.0UpperBody',
                             'MaterialUID': 'Flesh'},
                 'neck_07': {'JointChain': ['neck_07', 'neck_08', 'neck_09'],
                             'BodyPartUID': 'WildlifeHide1.0UpperBody',
                             'MaterialUID': 'Flesh'},
                 'head': {'JointChain': ['head'],
                          'BodyPartUID': 'WildlifeWeakPoint2.0Head',
                          'MaterialUID': 'FleshWeakpoint'},
                 'upperLeg': {'JointChain': ['upperLeg', 'lowerLeg'],
                              'BodyPartUID': 'WildlifeHide1.0LowerBody',
                              'MaterialUID': 'Flesh'},
                 'lowerLeg': {'JointChain': ['lowerLeg', 'ankle'],
                              'BodyPartUID': 'WildlifeHide1.0LowerBody',
                              'MaterialUID': 'Flesh'},
                 'ankle': {'JointChain': ['ankle', 'foot'],
                           'BodyPartUID': 'WildlifeHide1.0LowerBody',
                           'MaterialUID': 'Flesh'},
                 'foot': {'JointChain': ['foot', 'toe', 'footMid_End'],
                          'BodyPartUID': 'WildlifeHide1.0LowerBody',
                          'MaterialUID': 'Flesh'},
                 }

    def __init__(self, bone_name, index):
        self._bone_name = bone_name.split('|')[-1]
        self._bone_index = index
        self.is_hit_box_model = False

        for k, v in self.JointDict.items():
            if k in self._bone_name:
                self.is_hit_box_model = True
                self._body_part_uid = self.BodyPartUID[v['BodyPartUID']]
                self._material_uid = self.MaterialUID[v['MaterialUID']]

                pos_list, joint_chain = self._get_vertices(v['JointChain'])
                self._create_obb(pos_list, joint_chain)
                break

    def _create_cube(self, matrix):
        cube_name = '%s_hitboxmodel' % self._bone_name
        if mc.objExists(cube_name):
            mc.delete(cube_name)
        self._cube = mc.polyCube(n='%s_hitboxmodel' % self._bone_name)[0]
        mc.xform(self._cube, matrix=matrix)
        mc.parent(self._cube, self._bone_name)

    def _create_obb(self, pos_list, joint_chain):
        pos0 = mc.xform(joint_chain[1], q=True, t=True, ws=True)
        from_pos0 = om.MPoint(pos0[0], pos0[1], pos0[2])
        pos1 = mc.xform(joint_chain[0], q=True, t=True, ws=True)
        from_pos1 = om.MPoint(pos1[0], pos1[1], pos1[2])

        from_nrm = om.MVector(from_pos0 - from_pos1)

        pos0 = mc.xform(joint_chain[-2], q=True, t=True, ws=True)
        to_pos0 = om.MPoint(pos0[0], pos0[1], pos0[2])
        pos1 = mc.xform(joint_chain[-1], q=True, t=True, ws=True)
        to_pos1 = om.MPoint(pos1[0], pos1[1], pos1[2])

        to_nrm = om.MVector(to_pos0 - to_pos1)

        for i in reversed(range(len(pos_list))):
            pos = pos_list[i][0]
            from_v = om.MVector(pos - from_pos1)
            to_v = om.MVector(pos - to_pos1)

            if self._bone_index == 0:
                if to_v * to_nrm < 0:
                    pos_list.pop(i)
            else:
                if from_v * from_nrm < 0 or to_v * to_nrm < 0:
                    pos_list.pop(i)

        mc.select(cl=True)
        for pos in pos_list:
            mc.select(pos[1], add=True)

        points = om.MVectorArray()
        [points.append(om.MVector(p[0] * 100)) for p in pos_list]
        obb_instance = obb.OBB(points)
        self._create_cube(obb_instance.matrix)

    def _get_vertices(self, joint_chain):
        prefix = self._bone_name.replace(joint_chain[0], '')
        joints = [prefix + jnt for jnt in joint_chain if mc.objExists(prefix + jnt)]
        for transform in mc.ls(type='transform'):
            children = mc.listRelatives(transform, c=True, s=True, type='mesh')
            if children:
                skin_cluster = mm.eval('findRelatedSkinCluster %s' % transform)
                if not skin_cluster:
                    continue
                mc.select(cl=True)
                mc.skinCluster(skin_cluster, e=True, selectInfluenceVerts=joints)
                vertics = mc.ls(sl=True)
                # mc.select(cl=True)
                if vertics:
                    pos_list = list()
                    for vertex in vertics:
                        tmp_str = vertex.split('.vtx')[-1]
                        index = int(tmp_str[tmp_str.find('[')+1: tmp_str.rfind(':') if ':' in tmp_str else tmp_str.rfind(']')])
                        values = mc.xform(vertex, q=True, t=True, ws=True)
                        for i in range(0, len(values), 3):
                            pos = om.MPoint(values[i], values[i+1], values[i+2])
                            pos_list.append((pos, '%s.vtx[%s]' % (transform, index)))
                            index += 1

                    if len(joints) == 1:
                        children = mc.listRelatives(joints[0], c=True, type='joint')
                        joints.append(children[0])
                    return pos_list, joints

    @property
    def _rotation(self):
        rot = mc.getAttr(self._cube + '.r')[0]
        rot = [angle * math.pi / 180.0 for angle in rot]
        return [rot[0], -rot[1], -rot[2]]

    @property
    def _scale(self):
        scale = mc.getAttr(self._cube + '.s')[0]
        return [v / 100 for v in scale]

    @property
    def _translation(self):
        return mc.getAttr(self._cube + '.t')[0]

    @property
    def cube_name(self):
        return self._cube

    @property
    def data(self):
        return """
        {
            BodyPartUID = %s,
            BoneIndex = %s,
            BoneName = "%s",
            IgnoreStandardHitEffect = false,
            MaterialUID = %s,
            OverrideHitEffectName = "",
            Rotation = %s %s %s,
            Scale = %s %s %s,
            Translation = %s %s %s,
        },
        """ % (self._body_part_uid,
               self._bone_index,
               self._bone_name,
               self._material_uid,
               self._rotation[0], self._rotation[1], self._rotation[2],
               self._scale[0], self._scale[1], self._scale[2],
               self._translation[0], self._translation[1], self._translation[2])

