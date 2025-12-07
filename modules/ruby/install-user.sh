#!/bin/zsh

set -e

SCRIPT_DIR=$(dirname "$0")
REPO_ROOT=$SCRIPT_DIR/../..
source $REPO_ROOT/lib/output.sh

log "Installing ruby (user)..."
rbenv install -s 3:latest
rbenv global $(rbenv versions --bare | grep '^3\.' | tail -1)
success "Ruby (user) installation complete"

