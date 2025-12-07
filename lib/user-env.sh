#!/bin/zsh

# parse --user flag and set HOME/USER environment variables
# Usage: source this file in your script, then use $HOME and $USER

# save original positional parameters
_orig_args=("$@")

# debug: show what arguments we received
[[ ${#_orig_args[@]} -gt 0 ]] && echo "DEBUG: user-env.sh received ${#_orig_args[@]} arguments: ${_orig_args[@]}" || echo "DEBUG: user-env.sh received no arguments"

TARGET_USER=""
for ((i=1; i<=${#_orig_args[@]}; i++)); do
  if [[ "${_orig_args[$i]}" == "--user" ]]; then
    ((i++))
    if [[ $i -gt ${#_orig_args[@]} ]] || [[ -z "${_orig_args[$i]}" ]]; then
      echo "Error: --user requires a username"
      return 1 2>/dev/null || exit 1
    fi
    TARGET_USER="${_orig_args[$i]}"
    break
  fi
done

# set target user and home
if [[ -n "$TARGET_USER" ]]; then
  # get actual home directory path (handles cases where username != home directory name)
  TARGET_HOME=$(dscl . -read /Users/$TARGET_USER NFSHomeDirectory 2>/dev/null | awk '{print $2}')
  if [[ -z "$TARGET_HOME" ]]; then
    echo "Error: User '$TARGET_USER' not found"
    return 1 2>/dev/null || exit 1
  fi
  export HOME="$TARGET_HOME"
  export USER="$TARGET_USER"
else
  TARGET_HOME="$HOME"
  TARGET_USER="$USER"
fi

# clean up
unset _orig_args

