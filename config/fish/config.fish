if status is-interactive
    bass source ~/.nvm/nvm.sh
    pyenv init - | source
else if status is-login
    pyenv init --path | source
end

fish_add_path $HOME/.local/bin $HOME/.cargo/bin $HOME/.pyenv/bin

abbr -a -- rm 'rm -i'
abbr -a -- mv 'mv -i'
abbr -a -- cp 'cp -i'
abbr -a -- l eza
abbr -a -- ll 'eza -l'
abbr -a -- .. 'cd ..'

set -U fish_greeting

starship init fish | source
