#!/usr/local/bin/zsh
#
# git
#
# sets up gitignore and config

source ~/.zshrc

green 'Linking git config files'
rm -f ~/.git{ignore,config}
ln -s ~/.dotfiles/git/.gitignore ~
ln -s ~/.dotfiles/git/.gitconfig ~

green 'Setting global name and email'
git config --global user.name "Arya Kumar"
git config --global user.email "2019akumar2@tjhsst.edu"