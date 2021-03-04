import os

import setuptools

setuptools.setup(
    name='WildLifeLeg',
    version='1.0.0',
    keywords='WildLifeLeg',
    description='WildLifeLeg',
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
