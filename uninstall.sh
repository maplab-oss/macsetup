#!/bin/zsh

set -e

# run module uninstallers
[ -f "$HOME/Code/macsetup/modules/node/uninstall.sh" ] && $HOME/Code/macsetup/modules/node/uninstall.sh
[ -f "$HOME/Code/macsetup/modules/python/uninstall.sh" ] && $HOME/Code/macsetup/modules/python/uninstall.sh
[ -f "$HOME/Code/macsetup/modules/ruby/uninstall.sh" ] && $HOME/Code/macsetup/modules/ruby/uninstall.sh

# remove core files
rm -rf $HOME/Code
rm -f $HOME/.gitconfig
rm -f $HOME/.zshrc
rm -f $HOME/sandbox.sh
rm -f $HOME/.zsh_history
rm -rf $HOME/.zsh_sessions
rm -rf $HOME/.config/gh

# uninstall oh my zsh
source $HOME/.oh-my-zsh/tools/uninstall.sh

# uninstall homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
sudo rm -rf /opt/homebrew

echo "Note: Cache directories (~/.cache, ~/.npm, ~/.gem) and SSH keys (~/.ssh) may exist"
echo "Review and manually delete them if needed"
