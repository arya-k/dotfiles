# UTILITY

alias less='less -R'
alias grep='grep --color=auto'
alias ..='cd ../'
alias ls="ls -GF"
alias man=tldr
alias cat="bat -p --paging=never"

# GIT

alias gd='git diff'
alias gco='git checkout'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gpp='git pull; git push'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

# Package Managers:

update() {
  sudo softwareupdate -i -a
  brew update
  brew upgrade
}

clean() {
  brew cleanup
  brew cask cleanup
}

# SSH
tj() {
  sshpass -p"$(/usr/bin/security find-generic-password -s remote.tjhsst.edu -w)" ssh tj
}

# COMPILING
rc() {
  rustc $1.rc
  ./$1
  rm ./$1
}
