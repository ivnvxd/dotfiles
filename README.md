# dotfiles

## 1. Install brew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 2. Setup Git

Install git:

```sh
brew install git
```

Add git credentials:

```sh
git config --global user.name "Andrey Ivanov"
git config --global user.email "ivnv.xd@gmail.com"
```

Generate ssh keys:

```sh
# Generate new ssh key
ssh-keygen -t ed25519  -C "ivnv.xd@gmail.com"

# Start the ssh-agent in the background
eval "$(ssh-agent -s)"

# Add your SSH private key to the ssh-agent
ssh-add ~/.ssh/id_ed25519
```

[Add](https://github.com/settings/keys) ssh-key to GitHub account:

```shell
# Copy ssh key to clipboard
cat ~/.ssh/id_ed25519.pub
```

## 3. Copy dotfiles

from <https://github.com/ivnvxd/dotfiles>

```sh
git clone git@github.com:ivnvxd/dotfiles.git
```

## 4. Install everything from  `~/Brewfile`

```sh
brew bundle install
```

## 5. Setup fish shell

Make fish the default shell:

```sh
sudo bash -c 'echo $(which fish) >> /etc/shells'
chsh -s $(which fish)
```

Install fish `pure` theme:

```sh
fisher install rafaelrinaldi/pure
```

## 6. Setup tmux

Install Tmux Plugin Manager:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Install plugins with `<prefix> I`

## 7. Setup nvim

Install NvChad:

```sh
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

Do `n`ot install the example config.

Change theme: `Space-t-h`

Install syntax highlighting:

`:TSInstall python`
`:TSInstall go`

Install Mason: `:MasonInstallAll`

Show installed highlighted languages:`:TSInstallInfo`
Show cheatsheet: `Space-c-h`

## 8. Setup Vim

Install Plug

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

`:PlugInstall` to install plugins.

## 9. Setup Poetry

Either brew or:

```shell
curl -sSL https://install.python-poetry.org | python3 -
```

Configure Poetry to create vitual env inside each project

```shell
poetry config virtualenvs.in-project true
```

## 10. Restore settings

Syncalicious

from
`/Users/ve/Library/Mobile Documents/com~apple~CloudDocs/Syncalicious/macbook-air-andrey.local`
to
`~/Library/Preferences`

## 11. Add defaults

```sh
chflags nohidden ~/Library  # Show Library folder
defaults write com.apple.finder AppleShowAllFiles YES  # Show hidden files
defaults write com.apple.finder ShowPathbar -bool true  # Show path bar
defaults write com.apple.finder ShowStatusBar -bool true  # Show status bar
```

Enable key-repeating

```sh
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
defaults write com.vscodium ApplePressAndHoldEnabled -bool false                      # For VS Codium
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
defaults delete -g ApplePressAndHoldEnabled                                           # If necessary, reset global default
```

## 12. Setup Go

```sh
go install mvdan.cc/gofumpt@latest
go install -v github.com/incu6us/goimports-reviser/v3@latest
go install github.com/segmentio/golines@latest
go install github.com/go-delve/delve/cmd/dlv@latest

```
