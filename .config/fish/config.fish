if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH $HOME/.local/bin $PATH  # Local binaries
set -gx PATH /usr/local/bin /usr/local/sbin $PATH  # Homebrew
set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH  # M1 Mac homebrew
set -gx PATH ~/bin $PATH  # Custom scripts

set -gx GOPATH $HOME/go  # Go path
set -gx PATH $GOPATH/bin $PATH  # Go binaries

# Activate thefuck
thefuck --alias | source

# Aliases
alias ls='exa'
alias cat='bat'
alias vi='nvim'
alias vim='nvim'

alias ll='ls -la'
alias la='ls -lah'

alias ..='cd ..'
alias cd..='cd ..'

bind -M insert "ç" fzf-cd-widget

function update -d "update brew, fish, fisher and mac app store"
    echo 'Start updating ...'

    echo 'Updating Homebrew...'
    brew update
    brew upgrade
    brew cleanup

    echo 'Updating fish shell...'
    fisher update
    fish_update_completions

    #    echo 'Checking Apple Updates...'
    #    /usr/sbin/softwareupdate -ia

    echo 'All updates completed!'
    exit 0
end
