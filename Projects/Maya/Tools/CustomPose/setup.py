import os

import setuptools

setuptools.setup(
    name='CustomPose',
    version='1.0.0',
    keywords='CustomPose',
    description='CustomPose',
    long_description=open(
        os.path.join(
            os.path.dirname(__file__),
            'README.rst'
        )
    ).read(),
    author='wen-long.mo@ubisoft.com',
    author_email='wen-long.mo@ubisoft.com',
    packages=setuptools.find_packages(),
    license='MIT'
)
