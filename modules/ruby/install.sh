#!/bin/zsh

set -e

SCRIPT_DIR=$(dirname "$0")
$SCRIPT_DIR/install-admin.sh
$SCRIPT_DIR/install-user.sh
