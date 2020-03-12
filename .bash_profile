function __prompt_command() {
    local EXIT="$?"

    local RED="\[\033[1;31m\]"
    local PURPLE="\[\033[1;35m\]"
    local YELLOW="\[\033[1;33m\]"
    local GREEN="\[\033[01;32m\]"
    local BLUE="\[\033[01;34m\]"
    local CYAN="\[\033[1;36m\]"
    local WHITE="\[\033[0;37m\]"
    local COLOR_RESET="\[\033[0m\]"

    local SQUARE=$'\u25AA'

    PS1="$WHITE[\D{%d-%b %H:%M}]"
    PS1+=" $GREEN\u@\h$WHITE: $BLUE\w" 

    # Show non-zero exit codes
    if [ $EXIT != 0 ]; then
        PS1+=" ${RED}[${EXIT}]"
    fi

    # Show Git status
    local git_status=`git status -unormal 2>&1`
    if [[ $git_status != *"ot a git repo"* ]]; then
        PS1+=" $YELLOW[$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')" 
        if [[ $git_status == *"Changes to be committed"* ]]; then
            PS1+="${GREEN}${SQUARE}"
        fi
        if [[ $git_status == *"Changes not staged for commit"* ]]; then
            PS1+="${YELLOW}${SQUARE}"
        fi
        if [[ $git_status == *"Untracked files"* ]]; then
            PS1+="${RED}${SQUARE}"
        fi
        PS1+="$YELLOW]$COLOR_RESET"
    fi

    # Show active Python virtual env if set
    if [[ $VIRTUAL_ENV != "" ]]
    then
        PS1+=" ${CYAN}($(basename $VIRTUAL_ENV))"
    fi

    # Show active Node version (NVM) if set
    if [[ $NVM_BIN != "" ]]
    then
        PS1+=" ${PURPLE}(node $(basename $(dirname $NVM_BIN)))"
    fi

    PS1+=" $WHITE\n\$$COLOR_RESET "
}

export PROMPT_COMMAND=__prompt_command

# Aliases
alias du='du -b'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias l='exa'
alias ll='exa --long'
alias ls='ls --color=auto'
alias '..'='cd ..'

export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/system/bin:$PATH"

if [ "$(command -v kubectl)" ]; then
    source <(kubectl completion bash)
fi
