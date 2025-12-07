#!/bin/zsh

# parse --user flag and set HOME/USER environment variables
# Usage: source this file in your script, then use $HOME and $USER

TARGET_USER=""
for ((i=1; i<=$#; i++)); do
  if [[ "${@[$i]}" == "--user" ]]; then
    ((i++))
    if [[ $i -gt $# ]] || [[ -z "${@[$i]}" ]]; then
      echo "Error: --user requires a username"
      return 1 2>/dev/null || exit 1
    fi
    TARGET_USER="${@[$i]}"
    break
  fi
done

if [[ -n "$TARGET_USER" ]]; then
  TARGET_HOME=$(dscl . -read /Users/$TARGET_USER NFSHomeDirectory 2>/dev/null | awk '{print $2}')
  if [[ -z "$TARGET_HOME" ]]; then
    echo "Error: User '$TARGET_USER' not found"
    return 1 2>/dev/null || exit 1
  fi
  export HOME="$TARGET_HOME"
  export USER="$TARGET_USER"
  echo "Installing for user $USER with home directory $HOME"
fi

