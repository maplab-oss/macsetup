#!/bin/zsh

set -e

SCRIPT_DIR=$(dirname "$0")

# parse --user flag and set HOME/USER
# Try to source from local repo if available, otherwise download from GitHub
if [[ -f "$SCRIPT_DIR/lib/user-env.sh" ]]; then
  source "$SCRIPT_DIR/lib/user-env.sh"
else
  source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/user-env.sh)
fi

rm -rf $HOME/Code
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
sudo rm -rf /opt/homebrew
source $HOME/.oh-my-zsh/tools/uninstall.sh
rm $HOME/.gitconfig
rm $HOME/.zshrc
