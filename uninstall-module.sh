#!/bin/zsh

set -e

# Determine script directory (fallback to $HOME/Code/macsetup if run via curl)
if [[ "$0" == "-zsh" ]] || [[ "$0" == "zsh" ]]; then
  SCRIPT_DIR="$HOME/Code/macsetup"
else
  SCRIPT_DIR=$(dirname "$0")
fi

source "$SCRIPT_DIR/lib/user-env.sh" "$@"
echo "Proceeding as $USER with home directory $HOME"

# parse module name (skip --user and its value if present)
MODULE_NAME=""
for arg in "$@"; do
  if [[ "$arg" != "--user" ]] && [[ "$arg" != ${TARGET_USER} ]] && [[ -z "$MODULE_NAME" ]]; then
    if [[ "$arg" != -* ]]; then
      MODULE_NAME="$arg"
    fi
  fi
done

if [[ -z "$MODULE_NAME" ]]; then
  echo "Usage: uninstall-module.sh <module-name> [--user <username>]"
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

echo "Uninstalling $MODULE_NAME module..."
$SCRIPT_DIR/modules/$MODULE_NAME/uninstall.sh
echo "✓ $MODULE_NAME module uninstalled successfully"

