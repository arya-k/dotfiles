#!/usr/local/bin/zsh
#
# push.zsh
#
# Pushes all the settings changes to Github.

(cd ~/.dotfiles &&
cmd 'git add *' &&
cmd 'git commit -m "updated settings"' &&
cmd 'git push origin master'
)
