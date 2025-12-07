#!/bin/zsh

set -e

source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/output.sh)

log "Installing Ruby (user)."
rbenv install -s 3.3.6
rbenv global 3.3.6
success "Ruby (user) installation complete."

