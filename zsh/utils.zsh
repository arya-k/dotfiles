# Color functions:

red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)

white=$(tput setaf 7)

normal=$(tput sgr0)


function red {
    echo -e "${red}${1}${normal}"
}
function green {
    echo -e "${green}${1}${normal}"
}
function yellow {
    echo -e "${yellow}${1}${normal}"
}
function white {
    echo -e "${white}${1}${normal}"
}

function cmd {
    echo -e "${yellow}❯ ${bold}${@}${normal}"
    echo ${1} | zsh
}
