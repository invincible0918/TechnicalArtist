#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/11/22
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : svnWrapper.py


class SVNWrapper(object):
    def __init__(self, **kwargs):
        pass

    def commit(self):
        """
        This method includes both add and modify operation
        :return:
        """
        pass

    def delete(self):
        """
        Delete data
        :return:
        """
        pass

    def info(self):
        """
        Get client info
        :return:
        """


def Creator(**kwargs):
    return SVNWrapper(**kwargs)
