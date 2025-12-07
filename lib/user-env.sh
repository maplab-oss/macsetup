#!/bin/zsh

# parse --user flag and set HOME/USER environment variables
# Usage: source this file in your script, then use $HOME and $USER

TARGET_USER=""
while [[ $# -gt 0 ]]; do
  case $1 in
    --user)
      if [[ -z "$2" ]]; then
        echo "Error: --user requires a username"
        exit 1
      fi
      TARGET_USER="$2"
      shift 2
      ;;
    *)
      shift
      ;;
  esac
done

# set target user and home
if [[ -n "$TARGET_USER" ]]; then
  # get actual home directory path (handles cases where username != home directory name)
  TARGET_HOME=$(dscl . -read /Users/$TARGET_USER NFSHomeDirectory 2>/dev/null | awk '{print $2}')
  if [[ -z "$TARGET_HOME" ]]; then
    echo "Error: User '$TARGET_USER' not found"
    exit 1
  fi
  export HOME="$TARGET_HOME"
  export USER="$TARGET_USER"
else
  TARGET_HOME="$HOME"
  TARGET_USER="$USER"
fi

