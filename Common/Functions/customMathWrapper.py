#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/9/6
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : commonMathWrapper.py

# It's a wrapper file that let you use it within Maya environment
# Because Maya can't import the numpy, invoke this wrapper in Maya to start a command line
# Then retrieve the standard output as result


import sys
import customMath


def LinearEquationOfThreeVariablesWrapper(aMatrix, bMatrix, cMatrix, constMatrix):
    x0, x1, x1 = customMath.LinearEquationOfThreeVariables(aMatrix, bMatrix, cMatrix, constMatrix)
    sys.stdout.write('%s, %s, %s' % (x0, x1, x1))
