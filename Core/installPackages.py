#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2020/9/4
# @Company : INVINCIBLE STUDIO
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : installPackages.py


import os
import subprocess


def __run_pip(python_path, cmd, packages):
    py = os.path.join(python_path, r'Scripts\pip.exe')
    cmd = '"%s" %s %s' % (py, cmd, ' '.join(packages))
    cmd = cmd.replace('\\', '/')

    print 'Run command: %s' % cmd
    s = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
    for i in iter(s.stdout.readline, b''):
        print i.rstrip()
    return s.communicate()


def __get_package_egg_name(package_path):
    package = os.path.basename(package_path)
    tmp = package.split('-')
    return tmp[0] + '-' + tmp[1]


def __filter_packages(packages, need_install):
    import pkg_resources
    reload(pkg_resources)

    _packages = list(packages)
    resources = [d for d in pkg_resources.working_set]
    for i in reversed(range(len(_packages))):
        egg_name = __get_package_egg_name(_packages[i])
        has_package = False
        for resource in resources:
            if resource.egg_name().startswith(egg_name):
                has_package = True
                break

        if need_install:
            if has_package:
                _packages.pop(i)
        else:
            if not has_package:
                _packages.pop(i)

    return _packages


def install(python_path, ta_path):
    config_path = os.path.join(ta_path, r'Core/installMayaPackage.cfg')

    install_packages = list()
    uninstall_packages = list()

    with open(config_path) as f:
        packages = f.read()
        packages = packages.replace('\r', '\n')

        for package in packages.split('\n'):
            if package.startswith('--'):
                package_path = os.path.join(ta_path, 'Installer', package[2:])
                if os.path.isfile(package_path) and os.path.exists(package_path):
                    uninstall_packages.append(package_path)
            else:
                package_path = os.path.join(ta_path, 'Installer', package)
                if os.path.isfile(package_path) and os.path.exists(package_path):
                    install_packages.append(package_path)

        stdout_all = ''
        stderr_all = ''

        _install_packages = __filter_packages(install_packages, True)
        if _install_packages:
            stdout, stderr = __run_pip(python_path, 'install', _install_packages)
            stdout_all += stdout
            stderr_all += stderr
        else:
            stdout = '\nYou have already installed: \n%s\n' % install_packages
            stdout_all += stdout

        _uninstall_packages = __filter_packages(uninstall_packages, False)
        if _uninstall_packages:
            stdout, stderr = __run_pip(python_path, 'uninstall --yes', _uninstall_packages)
            stdout_all += stdout
            stderr_all += stderr
        else:
            stdout = '\nYou have already uninstalled: \n%s\n' % uninstall_packages
            stdout_all += stdout

        return stdout_all, stderr_all


if __name__ == '__main__':
    from Common.Tools.CommandPort import commandPort

    command = '''
from Core import installPackages
reload(installPackages)
installPackages.install('C:/Python27', 'D:/p4ws/wlm_AC617_blue/tools/dcc/blue/externalExecutables/TA')
    '''
    commandPort.run(command)
