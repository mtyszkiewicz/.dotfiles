# common configs
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM="xterm-256color"

export OPENCODE_ENABLE_EXA=1
export OPENCODE_EXPERIMENTAL_LSP_TOOL=true

alias tree="tree -C"
alias va="source .venv/bin/activate.fish"
alias vd="deactivate"
alias wr="wormhole receive"
alias ws="wormhole send"
alias nv="nvim ."
alias c="clear"
# alias code="open -b com.microsoft.VSCode '$argv'"
alias reload_fish_config='source "$__fish_config_dir/config.fish"'

set fish_greeting  # disable fish greeting
export OPENCODE_ENABLE_EXA=1
export OPENCODE_EXPERIMENTAL_LSP_TOOL=true

# macOS-specific configs
if test (uname) = 'Darwin'
    export PATH="/opt/homebrew/bin:$PATH"
    export HOMEBREW_NO_AUTO_UPDATE=1

    # Disable language special character suggestions on key hold
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

    if status --is-interactive
        SHELL=fish keychain --quiet --eval  | source
    end
    if type -q gpg
        export GPG_TTY=$(tty)
        gpgconf --launch gpg-agent
    end
end

# linux-specific configs
if test (uname) = 'Linux'
    alias nvitop="uvx --python 3.11 nvitop"
end

if type -q direnv
    export DIRENV_WARN_TIMEOUT="10s" # https://github.com/direnv/direnv/issues/272
    direnv hook fish | source
end

if type -q most
    export MANPAGER="/opt/homebrew/bin/most"
end

if test -f ~/.config/local-config.fish
    source ~/.config/local-config.fish
end

# opencode
fish_add_path /home/mtyszkiewicz/.opencode/bin
