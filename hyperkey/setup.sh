#!/usr/local/bin/zsh
#
# hyperkey
#
# Setups Hammerspoon and Karabiner Elements configs for Hyperkey setup
source ~/.zshrc

green 'Removing default configs'
rm -Rf ~/.hammerspoon
rm -Rf ~/.config/karabiner

green 'Symlinking configs'
ln -s ~/.dotfiles/hyperkey/hammerspoon ~/.hammerspoon
mkdir -p ~/.config
ln -s ~/.dotfiles/hyperkey/karabiner ~/.config/karabiner

green 'Reloading applications'
killall Hammerspoon &> /dev/null
sudo killall Karabiner-Menu &> /dev/null