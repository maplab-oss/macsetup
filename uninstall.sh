#!/bin/zsh

set -e

# parse --user flag and set HOME/USER
source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/user-env.sh)

rm -rf $HOME/Code
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
sudo rm -rf /opt/homebrew
source $HOME/.oh-my-zsh/tools/uninstall.sh
rm $HOME/.gitconfig
rm $HOME/.zshrc
