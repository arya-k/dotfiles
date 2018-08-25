#!/usr/local/bin/zsh
#
# pull.zsh
#
# pulls the local changes from the github repo, but doesn't run macos, etc by default.

(cd ~/.dotfiles && cmd 'git pull origin master')
