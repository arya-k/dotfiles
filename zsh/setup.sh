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
green 'Escalating privelages'
sudo -v

green 'Changing default shell for macOS'
if grep -Fxq '/etc/shells' '/usr/local/bin/zsh'; then
    sudo bash -c "echo '/usr/local/bin/zsh' >> /etc/shells"
fi
username=$(whoami)
sudo chsh -s /usr/local/bin/zsh $username &> /dev/null

# Install pure prompt
green 'Installing pure prompt'
if [ ! -f prompt_pure_setup ]; then
	green 'Downloading prompt_pure_setup.'
	curl -sS "https://raw.githubusercontent.com/sindresorhus/pure/master/pure.zsh" > prompt_pure_setup
fi
if [ ! -f async ]; then
	green 'Downloading async.'
	curl -sS "https://raw.githubusercontent.com/sindresorhus/pure/master/async.zsh" > async
fi

# Move .zshrc to correct location
green 'Installing zshrc'
rm -f ~/.zshrc
ln -s ~/.dotfiles/zsh/.zshrc ~
touch ~/.hushlogin
