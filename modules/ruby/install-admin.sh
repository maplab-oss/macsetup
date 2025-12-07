#!/bin/zsh

set -e

source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/output.sh)

log "Installing ruby (admin)..."
brew install rbenv ruby-build
success "Ruby (admin) installation complete"

