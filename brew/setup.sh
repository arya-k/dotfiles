#!/bin/bash
#
# Homebrew
#
# This installs + configures homebrew

# Colors
function red {
  echo -e "\033[0;31m${1}\033[0m"
}

function green {
  echo -e "\033[0;32m${1}\033[0m"
}

function yellow {
  echo -e "\033[0;33m${1}\033[0m"
}

if test ! $(which brew)
then
    yellow "Installing homebrew... "
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    green "Homebrew already installed."
fi

green "Updating + Upgrading Homebrew"
brew update
brew upgrade

apps=(
    ffmpeg
    wget
    tree
    python@2
    python3
    zsh
    fasd
    dockutil
)

green "Installing cli tools"
brew install "${apps[@]}"

apps=(
    font-roboto-mono
    iina
    visual-studio-code
    the-unarchiver
    transmission
    polymail
    skype
    goofy
    hammerspoon
    karabiner-elements
)

green "Installing applications..."
brew tap homebrew/cask-fonts
brew cask install "${apps[@]}"

qlplugins=(
    qlcolorcode
    qlstephen
    qlmarkdown
    quicklook-json
    qlimagesize
)

green "Installing Quicklook Plugins"
brew cask install "${qlplugins[@]}"

cat <<EOF
Please log into the App store and install:
Bear
Pages
Numbers
Keynote
EOF

echo -n 'Press ENTER after installing. ' && read

green "Installing SFMono"
sudo cp -R /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/. /Library/Fonts/

green "Cleaning up Homebrew"
brew cleanup
exit 0
