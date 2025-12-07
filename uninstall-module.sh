#!/bin/zsh

set -e

# Determine script directory
if [[ "$0" == "-zsh" ]] || [[ "$0" == "zsh" ]]; then
  SCRIPT_DIR="$HOME/Code/macsetup"
else
  SCRIPT_DIR=$(dirname "$0")
fi

# Load output helpers
source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/output.sh)

MODULE_NAME="$1"

if [[ -z "$MODULE_NAME" ]]; then
  echo "Usage: uninstall-module.sh <module-name>"
  exit 1
fi

if [[ ! -d "$SCRIPT_DIR/modules/$MODULE_NAME" ]]; then
  echo "Error: Module '$MODULE_NAME' not found"
  exit 1
fi

if [[ ! -f "$SCRIPT_DIR/modules/$MODULE_NAME/uninstall.sh" ]]; then
  echo "Module '$MODULE_NAME' has no uninstall script - nothing to do"
  exit 0
fi

log "Uninstalling $MODULE_NAME module..."
$SCRIPT_DIR/modules/$MODULE_NAME/uninstall.sh
success "$MODULE_NAME module uninstalled successfully"

