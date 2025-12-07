#!/bin/zsh

set -e

SCRIPT_DIR=$(dirname "$0")

# parse --user flag
TARGET_USER=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --user)
      if [[ -z "$2" ]]; then
        echo "Error: --user requires a username"
        exit 1
      fi
      TARGET_USER="$2"
      shift 2
      ;;
    *)
      shift
      ;;
  esac
done

# set target user and home
if [[ -n "$TARGET_USER" ]]; then
  TARGET_HOME="/Users/$TARGET_USER"
  export HOME="$TARGET_HOME"
  export USER="$TARGET_USER"
else
  TARGET_HOME="$HOME"
  TARGET_USER="$USER"
fi

# make code dir
mkdir -p $HOME/Code

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
BREW=/opt/homebrew/bin
export PATH="$BREW:$PATH"

# clone this repo
brew install gh
gh auth login || true
gh repo clone felixsebastian/macsetup $HOME/Code/macsetup

# install oh my zsh
KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# copy files
cp $HOME/Code/macsetup/payloads/gitconfig $HOME/.gitconfig
cp $HOME/Code/macsetup/payloads/zshrc $HOME/.zshrc
cp $HOME/Code/macsetup/payloads/sandbox.sh $HOME/sandbox.sh

# install homebrew packages
brew install go-task/tap/go-task
brew install go-task awscli tmux overmind

$SCRIPT_DIR/modules/node/install.sh
$SCRIPT_DIR/modules/python/install.sh
$SCRIPT_DIR/modules/ruby/install.sh
