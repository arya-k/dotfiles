#!/bin/bash
#
# install.sh
#
# Installs everything, step by step.

# At the very beginning, setup the ssh keys:
rm -rf ~/.ssh
ln -s ~/Library/Mobile Documents/com~apple~CloudDocs/ssh ~/.ssh

# Afterwards, instal cli tools
xcode-select -p &> /dev/null
if [ $? -ne 0 ]; then
   xcode-select --install
fi

# Then, install homebrew stuff:
/bin/bash ~/.dotfiles/brew/setup.sh

# Then, install rust:
curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path -y

# Next, install zsh
/bin/bash ~/.dotfiles/zsh/setup.sh

# Next, switch to zsh:
/usr/local/bin/zsh <<EOF

# Install vim
source ~/.dotfiles/vim/setup.sh

# Install git:
source ~/.dotfiles/git/setup.sh

# Install python:
source ~/.dotfiles/python/setup.sh

# Install app configs:
/usr/local/bin/zsh ~/.dotfiles/appconfigs/setup.sh

# Install hyperkey:
source ~/.dotfiles/hyperkey/setup.sh

# Install Desktop Wallpaper + Terminal Theme:
source ~/.dotfiles/theme/setup.sh

# Install macos config
source ~/.dotfiles/macos/setup.sh
