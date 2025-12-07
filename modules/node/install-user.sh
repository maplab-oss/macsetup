#!/bin/zsh

set -e

SCRIPT_DIR=$(dirname "$0")
REPO_ROOT=$SCRIPT_DIR/../..
source $REPO_ROOT/lib/output.sh

log "Installing node (user)..."
[ -d "$HOME/.nvm" ] || curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
[ -f "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"
command -v node >/dev/null 2>&1 || nvm install --lts
nvm alias default 'lts/*'
success "Node (user) installation complete"

