# dotfiles

## 0. Install Command Line Tools

```sh
xcode-select --install
```

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
```

```sh
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
git clone git@github.com:ivnvxd/dotfiles.git ~
```

## 4. Install everything from  `~/Brewfile`

```sh
brew bundle install
```

*To create a Brewfile:*

```sh
brew bundle dump
```

## 5. Setup zsh shell

Install oh-my-zsh:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install Powerlevel10k:

```sh
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# configure Pure theme:
p10k configure
```

Install plugins:

```sh
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
```

```sh
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
```

```sh
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## *5.1 Setup fish shell*

Add fish to the shell list:

```sh
sudo bash -c 'echo $(which fish) >> /etc/shells'
```

*(optional) make fish the default shell:*

```sh
chsh -s $(which fish)
```

*(optional) Uncomment in .config/tmux/tmux.conf:*

```sh
set-option -g default-shell "/opt/homebrew/bin/fish"
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

## 7. Setup Vim

Install Plug

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

`:PlugInstall` to install plugins.

## 8. Setup Poetry

Either **brew** or:

```shell
curl -sSL https://install.python-poetry.org | python3 -
```

Configure Poetry to create vitual env inside each project

```shell
poetry config virtualenvs.in-project true
```

## 9. Restore settings

Syncalicious

from
`/Users/ve/Library/Mobile Documents/com~apple~CloudDocs/Syncalicious/macbook-air-andrey.local`
to
`~/Library/Preferences`

## 10. Add defaults

```sh
chflags nohidden ~/Library  # Show Library folder
```

```sh
defaults write com.apple.finder AppleShowAllFiles true  # Show hidden files
```

```sh
defaults write com.apple.finder ShowPathbar -bool true  # Show path bar
```

```sh
defaults write com.apple.finder ShowStatusBar -bool true  # Show status bar
```

Enable key-repeating:

```sh
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false              # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false      # For VS Code Insider
defaults write com.vscodium ApplePressAndHoldEnabled -bool false                      # For VS Codium
defaults write com.microsoft.VSCodeExploration ApplePressAndHoldEnabled -bool false   # For VS Codium Exploration users
defaults delete -g ApplePressAndHoldEnabled                                           # If necessary, reset global default
```

Fix controller Home button:

```sh
defaults write com.apple.GameController bluetoothPrefsMenuLongPressAction -integer 0
defaults write com.apple.GameController bluetoothPrefsShareLongPressSystemGestureMode -integer -1

killall Dock
```

Add separator to Dock:

```sh
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'; killall Dock
```

## 11. Setup Go

```sh
go install mvdan.cc/gofumpt@latest
go install -v github.com/incu6us/goimports-reviser/v3@latest
go install github.com/segmentio/golines@latest
go install github.com/go-delve/delve/cmd/dlv@latest

go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

```

## 12. Setup VSCode

Install extensions:

```sh
./vscode-extension-install.sh
```

*To create a list of installed extensions:*

```sh
code --list-extensions > extensions.txt
```
