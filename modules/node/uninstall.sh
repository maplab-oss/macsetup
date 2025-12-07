#!/bin/zsh

[ -f "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"
command -v npm >/dev/null 2>&1 && npm uninstall -g pnpm pm2 zapper-cli
rm -rf $HOME/.nvm
rm -rf $HOME/Library/pnpm

