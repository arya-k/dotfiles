#!/bin/bash

/usr/local/bin/python2 -m pip install --upgrade pip setuptools wheel
/usr/local/bin/python3 -m pip install --upgrade pip setuptools wheel

rm /usr/local/bin/python
rm /usr/local/bin/pip

echo "#\!/bin/bash" >> /usr/local/bin/python
echo "echo Please specify python2 or python3" >> /usr/local/bin/python
chmod +x /usr/local/bin/python

/usr/local/bin/python2 -m pip install --user numpy scipy matplotlib
/usr/local/bin/python2 -m pip install --user numpy scipy matplotlib