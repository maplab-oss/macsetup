#!/bin/zsh

set -e

# Load output helpers
source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/output.sh)

log "Setting up user environment for $USER..."

# make code dir
mkdir -p $HOME/Code

# clone this repo
BREW=/opt/homebrew/bin
export PATH="$BREW:$PATH"
gh auth status >/dev/null 2>&1 || gh auth login
[ -d "$HOME/Code/macsetup" ] || gh repo clone felixsebastian/macsetup $HOME/Code/macsetup

# install oh my zsh
[ -d "$HOME/.oh-my-zsh" ] || KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# copy files
cp $HOME/Code/macsetup/payloads/gitconfig $HOME/.gitconfig
cp $HOME/Code/macsetup/payloads/zshrc $HOME/.zshrc
cp $HOME/Code/macsetup/payloads/sandbox.sh $HOME/sandbox.sh

# run module installers
$HOME/Code/macsetup/modules/node/install.sh
$HOME/Code/macsetup/modules/python/install-user.sh
$HOME/Code/macsetup/modules/ruby/install-user.sh

success "User environment setup complete for $USER"

