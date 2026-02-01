#!/bin/zsh

set -e

SCRIPT_DIR=$(dirname "$0")
source "$SCRIPT_DIR/../../lib/output.sh"

log "Uninstalling Google Cloud CLI module."
rm -rf $HOME/google-cloud-sdk
success "Google Cloud CLI module uninstalled."


