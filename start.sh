#!/bin/zsh

set -e

SCRIPT_DIR=$(dirname "$0")

# make code dir
mkdir -p $HOME/Code

# intstall homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
BREW=/opt/homebrew/bin
export PATH="$BREW:$PATH"

# clone this repo
brew install gh
gh auth login
gh repo clone felixsebastian/macsetup $HOME/Code/macsetup

# install oh my zsh
KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# copy files
cp $HOME/Code/macsetup/payloads/gitconfig $HOME/.gitconfig
cp $HOME/Code/macsetup/payloads/zshrc $HOME/.zshrc
cp $HOME/Code/macsetup/payloads/sandbox.sh $HOME/sandbox.sh

# install homebrew packages
brew install go-task/tap/go-task
brew install go-task node@20 pipx pyenv awscli

gh auth login
pipx ensurepath
pipx install poetry

poetry config virtualenvs.in-project true

npm install --global npm
npm install --global pnpm yarn pm2
