#!/bin/zsh

set -e

source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/output.sh)

log "Installing Google Cloud CLI (user)."
curl https://sdk.cloud.google.com | bash -s -- --disable-prompts --install-dir=$HOME
success "Google Cloud CLI (user) installation complete."

