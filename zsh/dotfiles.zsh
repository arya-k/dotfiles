#!/usr/local/bin/zsh

sub_help() {
    echo "Usage: dotfiles <command>"
    echo
    echo "Commands:"
    echo "  pull            Pulls the latest version from Github and installs"
    echo "  push            Syncs local settings changes to Github"
}

sub_pull() {
    source ~/.dotfiles/bin/pull.zsh
}

sub_push() {
    source ~/.dotfiles/bin/push.zsh
}

dotfiles () {
  COMMAND_NAME=$1
  SUB_COMMAND_NAME=$2

  case $COMMAND_NAME in
    "" | "-h" | "--help")
      sub_help
      ;;
    *)
      shift
      sub_${COMMAND_NAME} $@
      if [ $? = 127 ]; then
        echo "'$COMMAND_NAME' is not a known command or has errors." >&2
        sub_help
      fi
      ;;
  esac
}
