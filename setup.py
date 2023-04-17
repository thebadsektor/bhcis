from setuptools import setup, find_packages

setup(
    name='email_module',
    version='0.1',
    packages=find_packages(),
    install_requires=[
        'Flask-Mail==0.9.1'
    ],
)
