#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/9/5
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : math.py

import numpy as np


def LinearEquationOfThreeVariables(aMatrix, bMatrix, cMatrix, constMatrix):

    """
    :param aMatrix: []
    :param bMatrix: []
    :param cMatrix: []
    :param constMatrix: []
    :return: x0, x1, x2

        x0 + 2 * x1 + 3 * x2 = 14
    3 * x0 - 5 * x1 + 4 * x2 = 5
    5 * x0 - 2 * x1 - 2 * x2 = -5

    aMatrix = [1, 2, 3]
    bMatrix = [3, -5, 4]
    cMatrix = [5, -2, -2]
    constMatrix = [14, 5, -5]
    """
    a = np.array([aMatrix, bMatrix, cMatrix])
    b = np.array(constMatrix)

    x = np.linalg.solve(a, b)
    return x[0], x[1], x[2]
