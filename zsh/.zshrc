#!/usr/bin/env zsh
slim_path=~/.dotfiles/zsh
fpath=( $slim_path $fpath )

autoload -U promptinit && promptinit
prompt pure

autoload -U compinit
compinit

setopt autocd
setopt extendedglob
setopt NO_NOMATCH

export CLICOLOR=1

source $slim_path/correction.zsh
source $slim_path/completion.zsh
source $slim_path/aliases.zsh
source $slim_path/utils.zsh
source $slim_path/dotfiles.zsh

export EDITOR='/usr/local/bin/subl -w'
PATH='/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin'
PATH="$HOME/.cargo/bin:$PATH"

if command -v fasd >/dev/null 2>&1; then
  eval "$(fasd --init zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install posix-alias)"
fi

# export WORKON_HOME="/Users/arya/.virtualenvs"
# source /usr/local/bin/virtualenvwrapper.sh

