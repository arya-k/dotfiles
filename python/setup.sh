#!/bin/bash

# Upgrade the python installations
/usr/local/bin/python2 -m pip install --quiet --upgrade pip setuptools wheel
/usr/local/bin/python3 -m pip install --quiet --upgrade pip setuptools wheel

# Remove the extra python2 installation
rm -f /usr/local/bin/python
rm -f /usr/local/bin/pip

# Disallow a generic python command - force python2 or python3
echo "#\!/bin/bash" >> /usr/local/bin/python
echo "echo Please specify python2 or python3" >> /usr/local/bin/python
chmod +x /usr/local/bin/python

echo "#\!/bin/bash" >> /usr/local/bin/pip
echo "echo Please specify pip2 or pip3" >> /usr/local/bin/pip
chmod +x /usr/local/bin/pip

# Install standard and common libraries
/usr/local/bin/python2 -m pip install --quiet --user numpy scipy matplotlib requests
/usr/local/bin/python2 -m pip install --quiet --user numpy scipy matplotlib requests
