import os
from shared.MSVLib.msvTools import msvP4
from Common.Functions import commonFunction


def _update_studiolibrary():
    studio_library_path = os.path.join(os.environ['TATOOL'], r'Projects\Blue\dcc\maya\system\studiolibrary')
    # studio_library_path = os.path.join(r'\\ubisoft.org\blue\SHA\Animation\TA', r'Projects\Blue\dcc\maya\system\studiolibrary')
    local_path = os.path.join(msvP4.get_root(), r'tools\dcc\blue\dcc\maya\system\studiolibrary')

    commonFunction.cpByDir(studio_library_path, local_path)
    print '\n\n\t\tUpdate Studio Library Is Done!\n\n'


def update_manually():
    if os.environ['DEBUGSCRIPT'] == 'False':
        _update_studiolibrary()


update_manually()
