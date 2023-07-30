if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH $HOME/.local/bin $PATH  # Local binaries
set -gx PATH /usr/local/bin /usr/local/sbin $PATH  # Homebrew
set -gx PATH /opt/homebrew/bin $PATH  # M1 Mac homebrew
set -gx PATH ~/bin $PATH  # Custom scripts

# Activate thefuck
thefuck --alias | source

# Aliases
alias ls='exa'
alias cat='bat'

alias ll='ls -la'
alias la='ls -lah'

alias ..='cd ..'
alias cd..='cd ..'
