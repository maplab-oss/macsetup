#!/bin/zsh

set -e

echo "Installing system-wide dependencies..."

# install homebrew
command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
BREW=/opt/homebrew/bin
export PATH="$BREW:$PATH"

# install homebrew packages
brew install gh go-task/tap/go-task awscli tmux overmind

echo "✓ System-wide dependencies installed"
echo ""
echo "Next step: Run start-user.sh as the target user:"
echo "  sudo -u targetuser /bin/zsh -c \"\$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start-user.sh)\""

