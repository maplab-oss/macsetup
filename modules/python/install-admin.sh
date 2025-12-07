#!/bin/zsh

set -e

source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/output.sh)

log "Installing Python (admin)."
brew install pipx pyenv
success "Python (admin) installation complete."

