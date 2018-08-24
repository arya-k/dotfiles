# Color functions:

black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

normal=$(tput sgr0)

function black {
    echo -e "${black}${1}${normal}"
}
function red {
    echo -e "${red}${1}${normal}"
}
function green {
    echo -e "${green}${1}${normal}"
}
function yellow {
    echo -e "${yellow}${1}${normal}"
}
function blue {
    echo -e "${blue}${1}${normal}"
}
function magenta {
    echo -e "${magenta}${1}${normal}"
}
function cyan {
    echo -e "${cyan}${1}${normal}"
}
function white {
    echo -e "${white}${1}${normal}"
}

function cmd {
    echo -e "${yellow}❯ ${bold}${1}${normal}"
    echo ${1} | zsh
}
