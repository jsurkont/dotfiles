#! /bin/zsh

# load theme
. ~/.ztheme

# activate tab completion
autoload -U compinit
compinit

zstyle ':completion:*' menu select=10 # menu list with arrows selection when more than 10 options are displayed
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # make completion show colors

setopt correct # correct commands

# history settings
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups # ignore history duplicates
setopt appendhistory

### Aliases ###

# Global alias (usable like `ls ....`)
alias -g '...'='../..'
alias -g '....'='../../..'
alias -g '.....'='../../../..'

# Suffixed alias
alias -s avi=vlc
alias -s mkv=vlc
alias -s mp3=mplayer
alias -s pdf=evince

# System like alias
alias du='du -b'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias l='ls -bhl'
alias s='ls -bs'
alias ls='ls --color=auto'
alias '..'='cd ..'

# Other apps alias
alias less='less -f'

### Exports ###

export TERM=xterm-256color #change to 256 color mode

# Add $HOME/system/bin to the PATH
export PATH="$PATH:$HOME/system/bin"

export VIRTUAL_ENV_DISABLE_PROMPT=1 #Don't let virtualenv mess with our PS1

# Set virtualenvwrapper
if [ -f /usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh ]; then
    export WORKON_HOME=$HOME/.virtualenv
    export VIRTUALENVWRAPPER_SCRIPT=/usr/share/virtualenvwrapper/virtualenvwrapper.sh
    source /usr/share/virtualenvwrapper/virtualenvwrapper_lazy.sh
fi

# Set RVM
source $HOME/.rvm/scripts/rvm

# Set NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # Load NVM
