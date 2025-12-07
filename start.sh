#!/bin/zsh

set -e

SCRIPT_DIR=$(dirname "$0")

# run admin setup
$SCRIPT_DIR/start-admin.sh

# run user setup
$SCRIPT_DIR/start-user.sh
