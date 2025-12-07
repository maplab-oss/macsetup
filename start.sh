#!/bin/zsh

set -e

SCRIPT_DIR=$(dirname "$0")
source $SCRIPT_DIR/lib/output.sh

log "Starting complete macsetup installation..."
$SCRIPT_DIR/start-admin.sh
$SCRIPT_DIR/start-user.sh
success "Complete macsetup installation finished"
