import os

import setuptools

setuptools.setup(
    name='Exporter',
    version='1.0.0',
    keywords='Exporter',
    description='Exporter',
    long_description=open(
        os.path.join(
            os.path.dirname(__file__),
            'README.rst'
        )
    ).read(),
    author='mowl@popcap.com',
    author_email='mowl@popcap.com',
    packages=setuptools.find_packages(),
    license='MIT'
)
