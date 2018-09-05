#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/11/27
# @Company :
# @Author  : Mo Wenlong
# @Email   : invincible0918@126.com
# @File    : run.py


from cStringIO import StringIO
import os
import threading
import subprocess
import time
import yaml


OUTPUTSTREAMRESULT = 'OutputStreamResult'


class OutputStream(threading.Thread):
    def __init__(self):
        super(OutputStream, self).__init__()
        self.done = False
        self.buffer = StringIO()
        self.read, self.write = os.pipe()
        self.reader = os.fdopen(self.read)
        self.__result = None
        self.__resultKeyword = '%s:' % OUTPUTSTREAMRESULT
        self.start()

    def fileno(self):
        return self.write

    def run(self):
        while not self.done:
            print 'Still reading...'
            time.sleep(0.1)
            commonString = self.reader.readline()
            if commonString.startswith(self.__resultKeyword):
                self.__result = yaml.load(commonString[len(self.__resultKeyword):])
            self.buffer.write('%s' % commonString)
        self.reader.close()
        print 'Tread is closed'

    def close(self):
        self.done = True
        os.close(self.write)

    @property
    def result(self):
        return self.__result


def run(cmd):
    print '\n\tCommand is:\n'
    print cmd
    print '\n'

    out = OutputStream()
    err = OutputStream()
    proc = subprocess.Popen(cmd, shell=True, stdout=out, stderr=err)

    while proc.poll() is None:
        print 'Still waiting...'
        time.sleep(0.1)

    TimeOut = 5
    timeOut = 0

    while timeOut < TimeOut:
        time.sleep(0.1)
        timeOut += 0.1

    out.close()
    err.close()

    print '\n\tThe result of invoke command is: %s\n' % proc.returncode

    if proc.returncode == 0:
        output = out.buffer.getvalue()
        print '\n\tOutput is:\n%s' % output
        return out.result
    else:
        output = err.buffer.getvalue()
        print '\n\tError is:\n%s' % output
        return None
