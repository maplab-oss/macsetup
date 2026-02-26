#!/bin/zsh

REPO_PATH="$HOME/Code/macsetup"

check_uncommitted_changes() {
  if [ -d "$REPO_PATH/.git" ]; then
    cd "$REPO_PATH"
    if ! git diff-index --quiet HEAD -- 2>/dev/null || [ -n "$(git ls-files --others --exclude-standard)" ]; then
      return 0
    fi
  fi
  return 1
}

prompt_remove_repo() {
  if [ ! -d "$REPO_PATH" ]; then
    return 0
  fi

  error "⚠️  Warning: Macsetup repository will be removed. Location: $REPO_PATH"
  
  if check_uncommitted_changes; then
    error "⚠️  UNCOMMITTED OR UNSAVED CHANGES DETECTED! You have uncommitted changes or untracked files that will be LOST."
  fi
  
  echo -n "   Remove the repository and lose any changes? (y/N): "
  read -r response
  
  if [[ ! "$response" =~ ^[Yy]$ ]]; then
    error "Uninstallation cancelled."
    return 1
  fi
  
  return 0
}

prompt_override_repo() {
  if [ ! -d "$REPO_PATH" ]; then
    return 0
  fi

  note "Macsetup repository already exists at $REPO_PATH."
  
  if check_uncommitted_changes; then
    error "⚠️  UNCOMMITTED OR UNSAVED CHANGES DETECTED! You have uncommitted changes or untracked files."
  fi
  
  echo -n "   Override the repository and lose any changes? (y/N): "
  read -r response
  
  if [[ "$response" =~ ^[Yy]$ ]]; then
    log "Removing existing repository."
    rm -rf "$REPO_PATH"
    return 0
  else
    note "Using existing repository."
    return 2
  fi
}

