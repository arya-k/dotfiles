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
git config --global user.email "thearyaskumar@icloud.com"

(cd ~/.dotfiles && git remote set-url origin git@github.com:arya-k/dotfiles.git)