if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Paths
set -gx GOPATH $HOME/go  # Go path
set -gx PATH $GOPATH/bin $PATH  # Go binaries

# Aliases
alias ls='exa'
alias cat='bat'
alias vi='nvim'
alias vim='nvim'

alias ll='ls -la'
alias la='ls -lah'

alias ..='cd ..'
alias cd..='cd ..'

# Setup fzf
fzf --fish | source
bind -M insert "ç" fzf-cd-widget

# Change fzf theme
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

# Activate thefuck
thefuck --alias | source

# Update all
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

# Activate starship
starship init fish | source