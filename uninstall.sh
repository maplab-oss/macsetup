#!/bin/zsh

set -e

# parse --user flag and set HOME/USER
SCRIPT_DIR=$(dirname "$0")
if [[ -f "$SCRIPT_DIR/lib/user-env.sh" ]]; then
  source "$SCRIPT_DIR/lib/user-env.sh" "$@"
else
  source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/user-env.sh?$(date +%s)) "$@"
fi
echo "Proceeding as $USER with home directory $HOME"

rm -rf $HOME/Code
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
sudo rm -rf /opt/homebrew
source $HOME/.oh-my-zsh/tools/uninstall.sh
rm $HOME/.gitconfig
rm $HOME/.zshrc
