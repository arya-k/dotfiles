#!/usr/local/bin/zsh
#
# python
#
# Installs and configures python2 and python3 separately

source ~/.zshrc

# Upgrade the python installations
green 'Updating python installations'
python3 -m pip install --quiet --upgrade pip setuptools wheel

# Remove the extra python2 installation
green 'Removing extra python install'
rm -f /usr/local/bin/{python,pip}

# Disallow a generic python command - force python2 or python3
green 'Linking python3 to default'
ln -s /usr/local/bin/python3 /usr/local/bin/python
ln -s /usr/local/bin/pip3 /usr/local/bin/pip

# Install common libraries
green 'Installing standard libraries.'
python3 -m pip install --quiet --user numpy scipy matplotlib requests
