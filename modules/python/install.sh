#!/bin/zsh

set -e

SCRIPT_DIR=$(dirname "$0")
REPO_ROOT=$SCRIPT_DIR/../..
source $REPO_ROOT/lib/output.sh

log "Installing python module..."
$SCRIPT_DIR/install-admin.sh
$SCRIPT_DIR/install-user.sh
success "Python module installation complete"
