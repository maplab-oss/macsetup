#!/bin/zsh

rm -rf $HOME/Code
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
sudo rm -rf /opt/homebrew
source ~/.oh-my-zsh/tools/uninstall.sh
rm $HOME/.gitconfig
rm $HOME/.zshrc
