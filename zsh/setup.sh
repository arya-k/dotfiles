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

# Installing zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.dotfiles/zsh/zsh-autosuggestions

# Move .zshrc to correct location
green 'Installing zshrc'
rm -f ~/.zshrc
ln -s ~/.dotfiles/zsh/.zshrc ~
touch ~/.hushlogin
