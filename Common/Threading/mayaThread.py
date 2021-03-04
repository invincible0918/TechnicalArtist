#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 12/14/2018
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : mayaThread.py


import threading
from maya import utils as mu


class MayaThread(threading.Thread):
    def __init__(self, interval, function, args=[], kwargs={}, repeat=True):
        self.interval = interval
        self.function = function
        self.repeat = repeat
        self.args = args
        self.kwargs = kwargs
        self.event = threading.Event()
        threading.Thread.__init__(self)

    def run(self):
        def _mainLoop():
            self.event.wait(self.interval)
            if not self.event.isSet():
                if mu.executeInMainThreadWithResult:
                    try:
                        mu.executeInMainThreadWithResult(self.function, *self.args, **self.kwargs)
                    except Exception as e:
                        print '\n\texecuteInMainThreadWithResult cases error: "%s"' % e.message
                        print '\n\tstop thread!'
                        self.stop()
                else:
                    self.function(*self.args, **self.kwargs)

        if self.repeat:
            while not self.event.isSet():
                _mainLoop()
        else:
            _mainLoop()
            self.stop()

    def start(self):
        self.event.clear()
        threading.Thread.start(self)

    def stop(self):
        self.event.set()
        threading.Thread.__init__(self)


if __name__ == '__main__':
    def timerTest():
        print 'Hello World!'

    # create and start a timer
    mt = MayaThread(30, timerTest, repeat=True)
    mt.start()

    # To stop the timer
    mt.stop()
