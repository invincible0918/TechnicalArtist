import os

import setuptools

setuptools.setup(
    name='ProceduralAnim',
    version='1.0.0',
    keywords='ProceduralAnim',
    description='ProceduralAnim',
    long_description=open(
        os.path.join(
            os.path.dirname(__file__),
            'README.rst'
        )
    ).read(),
    author='invincible0918@126.com',
    author_email='invincible0918@126.com',
    packages=setuptools.find_packages(),
    license='MIT'
)
