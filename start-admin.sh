#!/bin/zsh

set -e

echo "Installing system-wide dependencies..."

# install homebrew
command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
BREW=/opt/homebrew/bin
export PATH="$BREW:$PATH"

# clone this repo (needed for module scripts)
brew install gh
gh auth status >/dev/null 2>&1 || gh auth login
[ -d "$HOME/Code/macsetup" ] || (mkdir -p $HOME/Code && gh repo clone felixsebastian/macsetup $HOME/Code/macsetup)

# install homebrew packages
brew install go-task/tap/go-task awscli tmux overmind

# run module admin installers
$HOME/Code/macsetup/modules/python/install-admin.sh
$HOME/Code/macsetup/modules/ruby/install-admin.sh

echo "✓ System-wide dependencies installed"
echo ""
echo "Next step: Run start-user.sh as the target user:"
echo "  /bin/zsh -c \"\$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start-user.sh)\""

