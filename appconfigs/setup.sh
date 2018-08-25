#!/usr/local/bin
#
# appconfigs
#
# sets all the app configs.

# vscode
rm -f "${HOME}/Library/Application Support/Code/User/settings.json"
ln -s ~/.dotfiles/appconfigs/vscode.json "${HOME}/Library/Application Support/Code/User/settings.json"

# iina
rm -f ~/Library/Preferences/com.colliderli.iina.plist
ln -s ~/.dotfiles/appconfigs/iina.plist ~/Library/Preferences/com.colliderli.iina.plist
