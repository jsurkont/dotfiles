if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path $HOME/.local/bin $HOME/.cargo/bin $HOME/.pyenv/bin

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

abbr -a -- rm 'rm -i'
abbr -a -- mv 'mv -i'
abbr -a -- cp 'cp -i'
abbr -a -- l exa
abbr -a -- ll 'exa -l'
abbr -a -- .. 'cd ..'

set -U fish_greeting

starship init fish | source

bass source ~/.nvm/nvm.sh
