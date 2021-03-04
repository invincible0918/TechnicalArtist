import os
import sys
import functions
reload(functions)


def _export(file_path):
    functions.open_maya(file_path)
    functions.export_animation(file_path)


if __name__ == '__main__':
    import maya.standalone
    maya.standalone.initialize()

    maya_files = [maya_file for maya_file in sys.argv[1].split(';') if os.path.exists(maya_file)]
    for maya_file in maya_files:
        _export(maya_file)
    os._exit(0)

