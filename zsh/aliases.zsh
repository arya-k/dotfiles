# UTILITY

alias less='less -R'
alias grep='grep --color=auto'
alias ls="ls -GF"
alias cat="bat -p --paging=never"

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
  j --purge
}

caen() {
    PASSWORD=$(security find-generic-password -a arkumar -s login.engin.umich.edu -w)
    ~/.ssh/auto/caen.ssh $PASSWORD
}