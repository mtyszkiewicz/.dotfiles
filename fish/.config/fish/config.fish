#/opt/homebrew/bin/fish

set -x POETRY_CONFIG_DIR $HOME/.config/pypoetry
set -x MANPAGER /opt/homebrew/bin/most
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -x TERM 'screen-256color'

alias code="open -b com.microsoft.VSCode '$argv'"
alias reload_fish_config 'source "$__fish_config_dir/config.fish"'
alias tree="tree -C"
# alias ssh="~/.ssh/ssh-wrapper.sh $argv"
alias vscode-setup="sh ~/.config/scripts/vscode-setup.sh"
alias zspotify='$HOME/projects/zspotify/.venv/bin/python3 -m zspotify -md "$HOME/Music/Spotify"'

set fish_greeting  # disable fish greeting
fish_add_path /opt/homebrew/bin
fish_add_path /Users/mtyszkiewicz/Library/Python/3.9/bin

if status --is-interactive
    SHELL=fish keychain --quiet --eval --agents ssh | source
end

source ~/.config/fish/lscolors.fish
fish_config theme choose "Rosé Pine"
