#!/bin/bash
set -e

# Default python is 2 and bin 2.7
PYTHON_VERSION=${PYTHON_VERSION:-"2"}
PYTHON_BIN=/usr/bin/python2.7
PIP_BIN=/usr/bin/pip2
SPHINX_BUILD_BIN=/usr/bin/sphinx-build

# Default version control is git
VERSION_CONTROL=${VERSION_CONTROL:-"git"}

# Python 3 projects user the python3 bin
if [ $PYTHON_VERSION == "3" ]
then
    PYTHON_BIN=/usr/bin/python3
    PIP_BIN==/usr/bin/pip3
fi

if [ $VERSION_CONTROL == "git" ]
then
    VERSION_CONTROL_BIN=/usr/bin/git
fi

# Clone the repository
mkdir -p /repository
mkdir -p /docs/html
$VERSION_CONTROL_BIN clone ${REPOSITORY} /repository

# Install the Python Package
$PYTHON_BIN /repository/setup.py install

# Install Other Package Dependencies
$PIP_BIN install -r REQS.DEVELOP.txt

# Generate the Sphinx Docs
$SPHINX_BUILD_BIN -b html /repository/docs /docs/html
