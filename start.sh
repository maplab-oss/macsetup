#!/bin/zsh

set -e

# parse --user flag and set HOME/USER
SCRIPT_DIR=$(dirname "$0")
if [[ -f "$SCRIPT_DIR/lib/user-env.sh" ]]; then
  source "$SCRIPT_DIR/lib/user-env.sh" "$@"
else
  source <(curl -fsSL "https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/user-env.sh?$(date +%s)") "$@"
fi
echo "Proceeding as $USER with home directory $HOME"

# make code dir
mkdir -p $HOME/Code

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

# copy files
cp $HOME/Code/macsetup/payloads/gitconfig $HOME/.gitconfig
cp $HOME/Code/macsetup/payloads/zshrc $HOME/.zshrc
cp $HOME/Code/macsetup/payloads/sandbox.sh $HOME/sandbox.sh

# install homebrew packages
brew install go-task/tap/go-task awscli tmux overmind

# repo is now cloned at $HOME/Code/macsetup, use that path
$HOME/Code/macsetup/modules/node/install.sh
$HOME/Code/macsetup/modules/python/install.sh
$HOME/Code/macsetup/modules/ruby/install.sh
