#!/bin/zsh

set -e

SCRIPT_DIR=$(dirname "$0")

# make code dir
mkdir -p $HOME/Code

# intstall homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
BREW=/opt/homebrew/bin

# install homebrew packages
$BREW/brew install go-task/tap/go-task
$BREW/brew install gh go-task node@20
$BREW/brew install python
$BREW/brew install awscli

# setup gh cli
$BREW/gh auth login

# copy files
$BREW/gh repo clone felixsebastian/macsetup $HOME/Code/macsetup
cp $HOME/Code/macsetup/payloads/gitconfig $HOME/.gitconfig
cp $HOME/Code/macsetup/payloads/zshrc $HOME/.zshrc

# install oh my zsh
KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
