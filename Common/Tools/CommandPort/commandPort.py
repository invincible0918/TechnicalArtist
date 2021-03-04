#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/8/2
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : commandPort.py


import socket
import telnetlib


def run(command, host=None, port=6000):
    """
    Run commands in Maya
    :param command:
    :param host:
    :param port:
    :return:
    """
    if not host:
        host = socket.gethostbyname(socket.gethostname())

    addr = (host, port)

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    s.connect(addr)
    s.send(command)

    data = s.recv(1024)  # receive the result info
    s.close()

    print '\n\tThe Result is \n%s\n' % data


def run2MB(command, host=None, port=4242):
    """
    Run commands in MotionBuilder
    :param command:
    :param host:
    :param port:
    :return:
    """
    if not host:
        host = socket.gethostbyname(socket.gethostname())

    host = telnetlib.Telnet(host, port)
    host.read_until('>>>', 5)

    print 'Command invokes here:\n%s\n' % command

    tmp = command.replace('\r', '\n').split('\n')
    l = len(tmp)

    newCommand = ''
    for i in range(l):
        c = tmp[i].strip()
        if c:
            if i != l - 1:
                newCommand += c + ';'
            else:
                newCommand += c

    print 'Format command "%s"\n' % newCommand

    host.write(newCommand)

    raw = str(host.read_until('>>>', .1))

    # removing garbage i don't want
    raw = raw.replace('\n\r>>>', '')
    raw = raw.replace('\r', '')

    # make an array, 1 element per line returned
    rawArr = raw.split('\n')
    print '\n\tThe Result is \n%s\n' % rawArr

    # Close the terminal
    host.close()
