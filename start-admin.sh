#!/bin/zsh

set -e

# Load output helpers
source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/output.sh)

log "Installing system-wide dependencies..."

# install homebrew
command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
BREW=/opt/homebrew/bin
export PATH="$BREW:$PATH"

# install homebrew packages
brew install gh go-task/tap/go-task awscli tmux overmind

# run module admin installers (use local if available, otherwise curl)
if [[ -f "$SCRIPT_DIR/modules/python/install-admin.sh" ]]; then
  $SCRIPT_DIR/modules/python/install-admin.sh
  $SCRIPT_DIR/modules/ruby/install-admin.sh
else
  /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/modules/python/install-admin.sh)"
  /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/modules/ruby/install-admin.sh)"
fi

success "System-wide dependencies installed"
echo ""
note "Next step: Run start-user.sh as the target user:"
echo "  /bin/zsh -c \"\$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start-user.sh)\""

