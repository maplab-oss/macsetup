#!/bin/zsh

set -e

[ -d "$HOME/.nvm" ] || curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
[ -f "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"
command -v node >/dev/null 2>&1 || nvm install node
