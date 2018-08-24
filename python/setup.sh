#!/usr/local/bin/zsh
#
# python
#
# Installs and configures python2 and python3 separately

source ~/.zshrc

# Upgrade the python installations
green 'Updating python installations'
python2 -m pip install --quiet --upgrade pip setuptools wheel
python3 -m pip install --quiet --upgrade pip setuptools wheel

# Remove the extra python2 installation
green 'Removing extra python install'
rm -f /usr/local/bin/{python,pip}

# Disallow a generic python command - force python2 or python3
green 'Disallowing generic python command'
echo "#\!/bin/bash" > /usr/local/bin/python
echo "echo Please specify python2 or python3" >> /usr/local/bin/python
chmod +x /usr/local/bin/python

echo "#\!/bin/bash" > /usr/local/bin/pip
echo "echo Please specify pip2 or pip3" >> /usr/local/bin/pip
chmod +x /usr/local/bin/pip

# Install standard and common libraries
green 'Installing standard libraries.'
python2 -m pip install --quiet --user numpy scipy matplotlib requests
python2 -m pip install --quiet --user numpy scipy matplotlib requests
