#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/9/5
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : updatePackages.py


import os
import subprocess


def do():
    installer = os.path.join(os.environ['TATOOL'], 'Installer')

    configPath = os.path.join(os.environ['TATOOL'], r'Core/installPackage.cfg')
    with open(configPath) as f:
        d = f.read()
        d = d.replace('\r', '\n')
        localLIBs = [os.path.join(installer, lib) for lib in d.split('\n') if lib != '']

    py = os.path.join(os.environ['LOCALPYTHON'], r'Scripts\pip.exe')
    cmd = '%s install -U %s' % (py, ' '.join(localLIBs))
    print cmd
    s = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
    for i in iter(s.stdout.readline, b''):
        print i.rstrip()
    print s.communicate()
