#!/bin/zsh

set -e

# parse --user flag
source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/user-env.sh) "$@"

# make code dir
mkdir -p $HOME/Code
[[ -n "$TARGET_USER" ]] && chown -R $TARGET_USER $HOME/Code

# install homebrew
command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
BREW=/opt/homebrew/bin
export PATH="$BREW:$PATH"

# clone this repo
brew install gh
gh auth status >/dev/null 2>&1 || gh auth login
[ -d "$HOME/Code/macsetup" ] || gh repo clone felixsebastian/macsetup $HOME/Code/macsetup

# install oh my zsh
[ -d "$HOME/.oh-my-zsh" ] || KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
[[ -n "$TARGET_USER" ]] && chown -R $TARGET_USER $HOME/.oh-my-zsh

# copy files
cp $HOME/Code/macsetup/payloads/gitconfig $HOME/.gitconfig
cp $HOME/Code/macsetup/payloads/zshrc $HOME/.zshrc
cp $HOME/Code/macsetup/payloads/sandbox.sh $HOME/sandbox.sh
[[ -n "$TARGET_USER" ]] && chown $TARGET_USER $HOME/.gitconfig $HOME/.zshrc $HOME/sandbox.sh

# install homebrew packages
brew install go-task/tap/go-task awscli tmux overmind

# repo is now cloned at $HOME/Code/macsetup, use that path
$HOME/Code/macsetup/modules/node/install.sh
$HOME/Code/macsetup/modules/python/install.sh
$HOME/Code/macsetup/modules/ruby/install.sh

# fix ownership of all files in home directory if installing for another user
[[ -n "$TARGET_USER" ]] && chown -R $TARGET_USER $HOME
