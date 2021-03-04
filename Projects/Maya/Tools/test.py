#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Time    : 5/10/2019 4:09 PM
# @Author  : wen-long.mo@ubisoft.com
# @Site    : 
# @File    : test.py
# @Software: PyCharm


import os, sys
import hashlib, random
import argparse
import datetime
import time

if sys.version_info > (3, 0):
	xrange = range

sys.path.append(os.path.abspath("snowdrop/modules/xs/python/snowdrop_rpc"))
sys.path.append(os.path.abspath("snowdrop/modules/xs/python/snowdrop"))
sys.path.append(os.path.abspath("scripts/python/lib/common"))

if sys.version_info > (3, 0):
	sys.path.append(os.path.abspath("scripts/python/lib/python3"))
else:
	sys.path.append(os.path.abspath("scripts/python/lib/python2"))

import urpc

assetservice = urpc.get_service("snowdrop/Assets")

import pyexec

for i in xrange(0, len(sys.argv) - 1):
	if sys.argv[i] == "-whitelist":
		urpc.add_whitelisted_host(sys.argv[i + 1])

wait_time = 10
connect_tcp_port = 22504

start_time = datetime.datetime.now()

print("Starting pyexec Python execution server (Debug version)")
urpc.set_peer_name("pyexec")
urpc.add_blind_peer("snowdrop")

urpc.connect("localhost", connect_tcp_port, "snowdrop", True)

have_connected_to_snowdrop = False

while True:
	try:
		if not urpc.pump_messages():
			break
	except (urpc.RpcParseError):
		pass

	time_since_last_message = urpc.get_time_since_last_message()
	if time_since_last_message is None or time_since_last_message > 3.0:
		time.sleep(0.1)

	if wait_time is not None:
		time_difference = (datetime.datetime.now() - start_time).total_seconds()
		if time_difference > wait_time:
			if not urpc.is_connected_to_peer("snowdrop"):
				print("No connection to Snowdrop, exiting")
				break
