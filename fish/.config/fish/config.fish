# common configs
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"

# macOS-specific configs
if test (uname) = 'Darwin'
    export PATH="/opt/homebrew/bin:$PATH"
    export HOMEBREW_NO_AUTO_UPDATE=1

    # Disable language special character suggestions on key hold
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
end

# linux-specific configs
if test (uname) = 'Linux'
end


if type -q direnv
    direnv hook fish | source
end

if type -q pyenv
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    pyenv init - | source
end

if type -q most
    export MANPAGER="opt/homebrew/bin/most"
end

alias tree="tree -C"
alias code="open -b com.microsoft.VSCode '$argv'"
alias reload_fish_config='source "$__fish_config_dir/config.fish"'
alias wr="wormhole receive"
alias ws="wormhole send"
alias nv="nvim ."
alias c="clear"

set fish_greeting  # disable fish greeting

if status --is-interactive
    SHELL=fish keychain --quiet --eval --agents ssh | source

    if type -q gpg
        export GPG_TTY=$(tty)
        gpgconf --launch gpg-agent
    end
end

if test -f ~/.config/local-config.fish
    source ~/.config/local-config.fish
end
