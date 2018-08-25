#!/bin/bash
#
# install.sh
#
# Installs everything, step by step.

# First, instal cli tools
xcode-select -p &> /dev/null
if [ $? -ne 0 ]; then
   xcode-select --install
fi

# Then, install homebrew stuff first:
/bin/bash ~/.dotfiles/brew/setup.sh

# Next, install zsh
/bin/bash ~/.dotfiles/zsh/setup.sh

# Next, switch to zsh:
/usr/local/bin/zsh <<EOF

# Install python:
source ~/.dotfiles/python/setup.sh

# Install hyperkey:
source ~/.dotfiles/hyperkey/setup.sh

# Install git:
source ~/.dotfiles/git/setup.sh

# Install app configs:
source ~/.dotfiles/appconfigs/setup.sh

# Install Desktop Wallpaper + Terminal Theme:
source ~/.dotfiles/icons/setup.sh

# Install macos config
source ~/.dotfiles/macos/setup.sh