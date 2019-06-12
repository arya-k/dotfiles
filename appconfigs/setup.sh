#!/usr/local/bin
#
# appconfigs
#
# sets all the app configs.

source ~/.zshrc

yellow "Sublime Text must be customized manually."
cat <<EOF
1. Tools > Install Package Control
2. Open Console > Package Control: Install Package > Ayu
EOF
open -a "Sublime Text"
echo -n 'Press ENTER after installing package... ' && read

rm -f "/Users/arya/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
ln -s ~/.dotfiles/appconfigs/Preferences.sublime-settings "/Users/arya/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"

# iina
rm -f ~/Library/Preferences/com.colliderli.iina.plist
ln -s ~/.dotfiles/appconfigs/iina.plist ~/Library/Preferences/com.colliderli.iina.plist
