#!/bin/zsh

set -e

# Determine script directory (fallback to $HOME/Code/macsetup if run via curl)
if [[ "$0" == "-zsh" ]] || [[ "$0" == "zsh" ]]; then
  SCRIPT_DIR="$HOME/Code/macsetup"
else
  SCRIPT_DIR=$(dirname "$0")
fi

# parse --user flag
source "$SCRIPT_DIR/lib/user-env.sh" "$@"

# get module name (first non-flag argument)
MODULE_NAME=""
for arg in "$@"; do
  if [[ "$arg" != "--user" ]] && [[ "$arg" != "$TARGET_USER" ]] && [[ "$arg" != -* ]]; then
    MODULE_NAME="$arg"
    break
  fi
done

if [[ -z "$MODULE_NAME" ]]; then
  echo "Usage: install-module.sh <module-name>"
  exit 1
fi

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
[[ -n "$TARGET_USER" ]] && chown -R $TARGET_USER $HOME
echo "✓ $MODULE_NAME module installed successfully"

