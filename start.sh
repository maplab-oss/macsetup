#!/bin/zsh

set -e

SCRIPT_DIR=$(dirname "$0")

# make code dir
mkdir -p $HOME/Code

# intstall homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
BREW=/opt/homebrew/bin

# clone this repo
$BREW/brew install gh
$BREW/gh auth login
$BREW/gh repo clone felixsebastian/macsetup $HOME/Code/macsetup

# install oh my zsh
KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# copy files
cp $HOME/Code/macsetup/payloads/gitconfig $HOME/.gitconfig
cp $HOME/Code/macsetup/payloads/zshrc $HOME/.zshrc
cp $HOME/Code/macsetup/payloads/sandbox.sh $HOME/sandbox.sh

source $HOME/.zshrc

# install homebrew packages
$BREW/brew install go-task/tap/go-task
$BREW/brew install go-task node@20
$BREW/brew install pipx
$BREW/brew install pyenv

$BREW/gh auth login
$BREW/pipx ensurepath
$BREW/pipx install awscli
$BREW/pyenv install 3.11
$BREW/pipx install --python python3.11 aider-chat
$BREW/pipx inject aider-chat google-generativeai
