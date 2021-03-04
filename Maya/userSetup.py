# \Users\userName\Documents\maya\scripts

import sys
import os
import imp

DEBUGSCRIPT = False
if DEBUGSCRIPT:
    CONFIG = 'config_debug.cfg'
else:
    CONFIG = 'config.cfg'

configPath = ''
for path in sys.path:
    _configPath = os.path.join(path, CONFIG)
    if os.path.exists(_configPath):
        configPath = _configPath
        break

if os.path.exists(configPath):
    with open(configPath) as f:
        data = f.read()
        data = data.replace('\r', '\n')
        values = [v for v in data.split('\n') if v != '']

        di = {}
        for value in values:
            pair = [v.strip() for v in value.split('=')]
            di.update({pair[0]:  pair[1]})

        # Begin to build environment
        di['DEBUGSCRIPT'] = DEBUGSCRIPT
        if di['DEBUGSCRIPT']:
            imp.load_source('buildMayaEnvironment', os.path.join(di['TATOOL'], r'Core/buildMayaEnvironment.py'))
        else:
            imp.load_compiled('buildMayaEnvironment', os.path.join(di['TATOOL'], r'Core/buildMayaEnvironment.pyc'))

        import buildMayaEnvironment
        buildMayaEnvironment.build(di)
else:
    print 'can not get file %s!' % configPath
