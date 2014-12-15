#!/usr/bin/env python

from setuptools import setup

long_description = open('README.md', 'r').read()

setup(
    name="ritalin",
    version="0.1",
    packages=['ritalin',],  # This is empty without the line below
    package_data={'ritalin': ['*.hy'],},
    author="Paul Tagliamonte",
    author_email="paultag@gmail.com",
    long_description=long_description,
    description='does some stuff with things & stuff',
    license="Expat",
    url="",
    platforms=['any']
)
