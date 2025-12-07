#!/bin/zsh

set -e

SCRIPT_DIR=$(dirname "$0")
REPO_ROOT=$SCRIPT_DIR/../..
source $REPO_ROOT/lib/output.sh

log "Installing ruby module..."
$SCRIPT_DIR/install-admin.sh
$SCRIPT_DIR/install-user.sh
success "Ruby module installation complete"
