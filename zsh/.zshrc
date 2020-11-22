#!/usr/bin/env zsh
slim_path=~/.dotfiles/zsh
fpath=( $slim_path $fpath )

# Install Starship
eval "$(starship init zsh)"

autoload -U compinit
if [[ $EUID -ne 0 ]]; then compinit; fi 
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

setopt autocd
setopt extendedglob
setopt NO_NOMATCH

export CLICOLOR=1

source $slim_path/completion.zsh
source $slim_path/aliases.zsh

if [[ $EUID -ne 0 ]]; then
   source $slim_path/gitaliases.zsh;
fi

export EDITOR='/usr/local/bin/subl -w'
PATH='/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin'
PATH="$HOME/.cargo/bin:$PATH"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export WORKON_HOME="/Users/arya/.virtualenvs"
source /usr/local/bin/virtualenvwrapper_lazy.sh

if [[ $EUID -eq 0 ]]; then
   cowsay -f groot "I AM ROOT"
fi
