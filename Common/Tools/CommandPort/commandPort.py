#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/8/2
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : commandPort.py


import socket


def run(command, host=None, port=6000):
    if not host:
        host = socket.gethostbyname(socket.gethostname())

    addr = (host, port)

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    s.connect(addr)
    s.send(command)

    data = s.recv(1024)  # receive the result info
    s.close()

    print '\n\tThe Result is \n%s\n' % data

