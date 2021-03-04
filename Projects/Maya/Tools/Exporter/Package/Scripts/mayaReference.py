import os
import sys
import functions
reload(functions)


def _reference(file_path, reference_file):
    functions.open_maya(file_path)
    functions.reference_animation(file_path, reference_file)
    functions.save_maya(file_path)


if __name__ == '__main__':
    import maya.standalone
    maya.standalone.initialize()

    files = [maya_file for maya_file in sys.argv[1].split(';') if os.path.exists(maya_file)]
    maya_files = files[:-1]
    reference_file = files[-1]

    for maya_file in maya_files:
        _reference(maya_file, reference_file)
    os._exit(0)

