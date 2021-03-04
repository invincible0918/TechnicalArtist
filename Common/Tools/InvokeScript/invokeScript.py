#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/11/27
# @Company : INVINCIBLE STUDIO
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
SLEEPTIME = 0.5


class OutputStream(threading.Thread):
    def __init__(self, consoleOutput=None):
        super(OutputStream, self).__init__()
        self.done = False
        self.buffer = StringIO()
        self.read, self.write = os.pipe()
        self.reader = os.fdopen(self.read)
        self.__result = None
        self.__resultKeyword = '%s:' % OUTPUTSTREAMRESULT
        self.__consoleOutput = consoleOutput
        self.start()

    def fileno(self):
        return self.write

    def run(self):
        while not self.done:
            commonString = self.reader.readline()
            if self.__consoleOutput:
                self.__consoleOutput('Console output: %s' % commonString)
            else:
                print 'Output: %s' % commonString
            time.sleep(0.1)
            if commonString.startswith(self.__resultKeyword):
                self.__result = yaml.load(commonString[len(self.__resultKeyword):])
            self.buffer.write('%s' % commonString)
        self.reader.close()

        if self.__consoleOutput:
            self.__consoleOutput('Console output: Thread is closed')
        else:
            print 'Output: Thread is closed'

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
        time.sleep(SLEEPTIME)

    TimeOut = 5
    timeOut = 0

    while timeOut < TimeOut:
        time.sleep(SLEEPTIME)
        timeOut += SLEEPTIME

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


def runStandalone(cmd, callback):
    callback('\nConsole output: Invoke command "%s"\n' % cmd)

    out = OutputStream(callback)
    err = OutputStream(callback)
    proc = subprocess.Popen(cmd, shell=True, stdout=out, stderr=err)

    while proc.poll() is None:
        callback('Console output: Still waiting...')
        time.sleep(SLEEPTIME)

    TimeOut = 5
    timeOut = 0

    while timeOut < TimeOut:
        time.sleep(SLEEPTIME)
        timeOut += SLEEPTIME

    out.close()
    err.close()

    callback('\nConsole output: The result of invoke command is: %s\n' % proc.returncode)

    if proc.returncode == 0:
        output = out.buffer.getvalue()
        callback('\nConsole output: Output is: %s\n' % output)
        return out.result
    else:
        output = err.buffer.getvalue()
        callback('\nConsole output: Error is: %s\n' % output)
        return None
