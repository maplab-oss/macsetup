#!/bin/zsh

set -e

MODULE_NAME="$1"

if [[ -z "$MODULE_NAME" ]]; then
  echo "Usage: install-module.sh <module-name>"
  exit 1
fi

SCRIPT_DIR=$(dirname "$0")
source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/user-env.sh)

if [[ ! -d "$SCRIPT_DIR/modules/$MODULE_NAME" ]]; then
  echo "Error: Module '$MODULE_NAME' not found"
  exit 1
fi

if [[ ! -f "$SCRIPT_DIR/modules/$MODULE_NAME/install.sh" ]]; then
  echo "Module '$MODULE_NAME' has no install script - nothing to do"
  exit 0
fi

echo "Installing $MODULE_NAME module..."
$SCRIPT_DIR/modules/$MODULE_NAME/install.sh
echo "✓ $MODULE_NAME module installed successfully"

