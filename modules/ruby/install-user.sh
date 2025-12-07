#!/bin/zsh

set -e

source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/output.sh)

log "Installing ruby (user)..."
rbenv install -s 3:latest
rbenv global $(rbenv versions --bare | grep '^3\.' | tail -1)
success "Ruby (user) installation complete"

