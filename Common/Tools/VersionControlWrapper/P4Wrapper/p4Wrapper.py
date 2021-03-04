#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 2017/11/22
# @Company : UBISOFT SHANGHAI
# @Author  : Mo Wenlong
# @Email   : wen-long.mo@ubisoft.com
# @File    : p4Wrapper.py


from P4 import P4, P4Exception
import os
import time


class P4Wrapper(object):
    TimeOut = 3.0

    def __init__(self, **kwargs):
        self.__p4 = P4()  # Create the P4 instance

        self.__kwargs = kwargs

        # connect now
        self.__p4.port = kwargs['port']
        self.__p4.user = kwargs['user']
        self.__p4.password = kwargs['password']
        self.__p4.connect()

        while not self.__p4.connected():
            print 'Connecting...'
            time.sleep(0.1)

        # login now
        try:
            print 'Login now...'
            # don't use p4.run_login()
            # don't know why p4.run_login works again
            # self.__p4.run_login()
            os.popen('echo %s | p4 -p %s -u %s login -a'
                     % (self.__p4.password, self.__p4.port, self.__p4.user))
        except P4Exception:
            print 'Can not login by echo command, try p4.run_login...'
            for e in self.__p4.errors:  # Display errors
                print e

            try:
                self.__p4.run_login()
                # os.popen('echo %s | p4 -p %s -u %s login -a'
                #          % (self.__p4.password, self.__p4.port, self.__p4.user))

            except P4Exception:
                for e in self.__p4.errors:  # Display errors
                    print e

        self.__allClients = self.__getAllClients()
        print '\n\tAllClients info:'
        print '\t\t % s' % self.__allClients

        for data in self.__allClients:
            if ('branchPath' in self.__kwargs) and (os.path.normpath(data['Root']) == os.path.normpath(kwargs['branchPath'])):
                self.__p4.client = data['client']

        # get md5 pass word
        self.__password = self.__p4.password

    def commit(self):
        """
        This method includes both add and modify operation
        :param dataList: data list needs to commit
        :param msg: commit message
        :return:
        """
        dataList = self.__kwargs['delete'].split(',')
        msg = self.__kwargs['msg']
        return
        for data in dataList:
            # if this f has no trace, thus it's a new file
            try:
                self.__p4.run_filelog(data)
                self.__p4.run_edit(data)
            except P4Exception:
                for e in self.__p4.errors:  # Display errors
                    print e
                self.__p4.run_add(data)

        self.__submit(msg)

    def delete(self):
        """
        Delete data
        :param dataList: data list needs to delete
        :param msg: commit message
        :return:
        """
        dataList = self.__kwargs['delete'].split(',')
        msg = self.__kwargs['msg']
        return
        for data in dataList:
            # if this f has no trace, thus it's a new file
            try:
                self.__p4.run_delete(data)
            except P4Exception:
                for e in self.__p4.errors:  # Display errors
                    print e

        self.__submit(msg)

    def getInfo(self):
        """
        Get client info
        :return:
        """
        curTime = 0
        while not self.__allClients:
            print 'Getting all clients...'
            time.sleep(0.1)
            curTime += 0.1
            if curTime > self.TimeOut:
                print 'TimeOut to get all clients...'
                break

        return {'allClients': self.__allClients, 'password': self.__password}

    def __getAllClients(self):
        try:
            os.popen('echo %s | p4 -p %s -u %s login -a'
                     % (self.__p4.password, self.__p4.port, self.__p4.user))
            return self.__p4.run('clients', '-u', self.__p4.user)
        except P4Exception:
            for e in self.__p4.errors:  # Display errors
                print e
            return []

    def __submit(self, msg):
        changeList = self.__p4.fetch_change()
        changeList['Description'] = msg
        # # addPendingNum = p4.save_change(changeList)[0].split()[1]
        #
        try:
            self.__p4.run_submit(changeList)
        except P4Exception:
            for e in self.__p4.errors:  # Display errors
                print e

            createdCLNumber = self.__p4.save_change(changeList)[0].split()[1]
            self.__p4.run_change('-d', createdCLNumber)

        self.__p4.disconnect()  # Disconnect from the server


def Creator(**kwargs):
    return P4Wrapper(**kwargs)
