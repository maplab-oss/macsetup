#!/bin/zsh

set -e

SCRIPT_DIR=$(dirname "$0")
REPO_ROOT=$SCRIPT_DIR/../..
source $REPO_ROOT/lib/output.sh

log "Installing ruby (admin)..."
brew install rbenv ruby-build
success "Ruby (admin) installation complete"

