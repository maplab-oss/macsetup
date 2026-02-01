#!/bin/zsh

set -e

source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/output.sh)
log "Installing system-wide dependencies."

command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
BREW=/opt/homebrew/bin
export PATH="$BREW:$PATH"
brew install gh go-task/tap/go-task awscli tmux overmind

/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/modules/node/install-admin.sh)"
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/modules/python/install-admin.sh)"
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/modules/ruby/install-admin.sh)"

success "System-wide dependencies installed."
note "Next step: Run start-user.sh as the target user: /bin/zsh -c \"\$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start-user.sh)\""
