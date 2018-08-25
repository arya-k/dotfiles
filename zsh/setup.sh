#!/bin/bash
#
# zsh
#
# This sets up the zsh environment completely

green=$(tput setaf 2)
normal=$(tput sgr0)

function green {
    echo -e "${green}${1}${normal}"
}

# Start by changing the default shell
green 'Escalating privilages'
sudo -v

green 'Changing default shell for macOS'
if grep -Fxq '/etc/shells' '/usr/local/bin/zsh'; then
    sudo bash -c "echo '/usr/local/bin/zsh' >> /etc/shells"
fi
username=$(whoami)
sudo chsh -s /usr/local/bin/zsh $username &> /dev/null

# Install pure prompt
rm -f ~/.dotfiles/zsh/prompt_pure_setup
rm -f ~/.dotfiles/zsh/async

green 'Installing pure prompt'
curl -sS "https://raw.githubusercontent.com/sindresorhus/pure/master/pure.zsh" > ~/.dotfiles/zsh/prompt_pure_setup

green 'Downloading async.'
curl -sS "https://raw.githubusercontent.com/sindresorhus/pure/master/async.zsh" > ~/.dotfiles/zsh/async

# Move .zshrc to correct location
green 'Installing zshrc'
rm -f ~/.zshrc
ln -s ~/.dotfiles/zsh/.zshrc ~
touch ~/.hushlogin
