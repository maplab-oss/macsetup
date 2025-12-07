#!/bin/zsh

set -e

source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/output.sh)

log "Installing Node (user)."
[ -d "$HOME/.nvm" ] || curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
[ -f "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"
command -v node >/dev/null 2>&1 || nvm install --lts
nvm alias default 'lts/*'
success "Node (user) installation complete."

