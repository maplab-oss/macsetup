#!/bin/zsh

set -e

MODULE_NAME="$1"

if [[ -z "$MODULE_NAME" ]]; then
  echo "Usage: uninstall-module.sh <module-name>"
  exit 1
fi

SCRIPT_DIR=$(dirname "$0")
source "$SCRIPT_DIR/lib/user-env.sh"

if [[ ! -d "$SCRIPT_DIR/modules/$MODULE_NAME" ]]; then
  echo "Error: Module '$MODULE_NAME' not found"
  exit 1
fi

if [[ ! -f "$SCRIPT_DIR/modules/$MODULE_NAME/uninstall.sh" ]]; then
  echo "Module '$MODULE_NAME' has no uninstall script - nothing to do"
  exit 0
fi

echo "Uninstalling $MODULE_NAME module..."
$SCRIPT_DIR/modules/$MODULE_NAME/uninstall.sh
echo "✓ $MODULE_NAME module uninstalled successfully"

