#!/usr/local/bin/zsh
#
# vim
#
# sets up .vimrc and .vim

source ~/.zshrc

green 'Installing vim'
rm -rf ~/.vim{,rc}
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vim/.vimrc ~