from .utils import eigh
from maya import cmds
from maya import OpenMaya


class OBB(object):
    def __init__(self, points):
        self.points = points

        eigenVectors, center, obb_extents = self.build_from_points()

        # Naturally aligned axis for x, y, z.
        self.eigenVectors = eigenVectors

        # Center point.
        self._center = center

        # Extents (length) of the bounding in x, y, z.
        self._obb_extents = obb_extents

        self._matrix = self.getMatrix()

    @property
    def matrix(self):
        """
        Property matrix of the bounding box.
        """
        return self._matrix

    @property
    def center(self):
        """
        Property center of the bounding box.

        Returns:
            (OpenMaya.MVector)
        """
        return self._center

    def getMatrix(self):
        """
        Gets the matrix representing the transformation of the bounding box.

        Raises:
            None

        Returns:
            (list of floats) Matrix
        """
        m = [(self.eigenVectors[1].x * self._obb_extents.y * 2),
             (self.eigenVectors[1].y * self._obb_extents.y * 2),
             (self.eigenVectors[1].z * self._obb_extents.y * 2),
             0.0,
             (self.eigenVectors[2].x * self._obb_extents.z * 2),
             (self.eigenVectors[2].y * self._obb_extents.z * 2),
             (self.eigenVectors[2].z * self._obb_extents.z * 2),
             0.0,
             (self.eigenVectors[0].x * self._obb_extents.x * 2),
             (self.eigenVectors[0].y * self._obb_extents.x * 2),
             (self.eigenVectors[0].z * self._obb_extents.x * 2),
             0.0,
             self._center.x,
             self._center.y,
             self._center.z,
             1.0]

        # Get the scale.
        mMat = OpenMaya.MMatrix()
        OpenMaya.MScriptUtil.createMatrixFromList(m, mMat)

        if mMat.det4x4() < 0:
            m[8] *= -1
            m[9] *= -1
            m[10] *= -1

        return m

    def build_from_points(self):
        """
        Bounding box algorithm using vertex points.

        Raises:
            None

        Returns:
            EigenVectors(OpenMaya.MVector)
            CenterPoint(OpenMaya.MVector)
            BoundingExtents(OpenMaya.MVector)
        """
        pointSize = float(self.points.length())

        mu = OpenMaya.MVector(0.0, 0.0, 0.0)
        # Calculate the average position of points.
        for p in xrange(int(pointSize)):
            mu += self.points[p] / pointSize

        cxx, cxy, cxz, cyy, cyz, czz = 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
        for p in xrange(int(pointSize)):
            p = self.points[p]
            cxx += p.x * p.x - mu.x * mu.x
            cxy += p.x * p.y - mu.x * mu.y
            cxz += p.x * p.z - mu.x * mu.z
            cyy += p.y * p.y - mu.y * mu.y
            cyz += p.y * p.z - mu.y * mu.z
            czz += p.z * p.z - mu.z * mu.z

        # Covariance Matrix
        C = [[cxx, cxy, cxz],
             [cxy, cyy, cyz],
             [cxz, cyz, czz]]

        return self.build_from_covariance_matrix(
            cvMatrix=C)

    def build_from_covariance_matrix(self, cvMatrix=None):
        """
        Build eigen vectors from covariance matrix.

        :param matrix(list of lists): covariance matrix

        Raises:
            None

        Returns:
            None
        """
        # Calculate the natural axes by getting the eigen vectors.
        eigenValues, eigVec = eigh(cvMatrix)

        r = OpenMaya.MVector(eigVec[0][0], eigVec[1][0], eigVec[2][0])
        r.normalize()

        u = OpenMaya.MVector(eigVec[0][1], eigVec[1][1], eigVec[2][1])
        u.normalize()

        f = OpenMaya.MVector(eigVec[0][2], eigVec[1][2], eigVec[2][2])
        f.normalize()

        minim = OpenMaya.MVector(1e10, 1e10, 1e10)
        maxim = OpenMaya.MVector(-1e10, -1e10, -1e10)

        for i in xrange(self.points.length()):
            pnt = self.points[i]

            p_prime = OpenMaya.MVector(
                r * pnt, u * pnt, f * pnt)

            minim = OpenMaya.MVector(
                min(minim.x, p_prime.x),
                min(minim.y, p_prime.y),
                min(minim.z, p_prime.z))
            maxim = OpenMaya.MVector(
                max(maxim.x, p_prime.x),
                max(maxim.y, p_prime.y),
                max(maxim.z, p_prime.z))

        centerPoint = (maxim + minim) * .5
        m_ext = (maxim - minim) * .5

        R = OpenMaya.MVector(r.x, u.x, f.x)
        U = OpenMaya.MVector(r.y, u.y, f.y)
        F = OpenMaya.MVector(r.z, u.z, f.z)

        m_pos = OpenMaya.MVector(
            R * centerPoint, U * centerPoint, F * centerPoint)

        return [r, u, f], m_pos, m_ext
