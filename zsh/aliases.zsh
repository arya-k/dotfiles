# UTILITY

alias less='less -R'
alias grep='grep --color=auto'
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
alias gc='git commit -m '

untar() {
  tar -xvf $1
  rm $1
}

store() {
  mkdir "${@: -1}"
  mv $@
}

# Package Managers:

update() {
  sudo softwareupdate -i -a
  brew update
  brew upgrade
}

clean() {
  brew cleanup
  brew cask cleanup
  j --purge
}

caen() {
    PASSWORD=$(security find-generic-password -a arkumar -s login.engin.umich.edu -w)
    echo -n -e "\033]0;ssh caen\007" && ~/.ssh/auto/caen.ssh $PASSWORD
}

# COMPILING
rc() {
  rustc $1.rc
  ./$1
  rm ./$1
}
