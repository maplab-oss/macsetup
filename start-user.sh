#!/bin/zsh

set -e

source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/output.sh)
source <(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/lib/repo-prompt.sh)
log "Setting up user environment for $USER..."
mkdir -p $HOME/Code
BREW=/opt/homebrew/bin
export PATH="$BREW:$PATH"
gh auth status >/dev/null 2>&1 || gh auth login

prompt_override_repo
PROMPT_RESULT=$?
if [ $PROMPT_RESULT -eq 0 ]; then
  gh repo clone felixsebastian/macsetup $HOME/Code/macsetup
fi
[ -d "$HOME/.oh-my-zsh" ] || KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

cp $HOME/Code/macsetup/payloads/gitconfig $HOME/.gitconfig
cp $HOME/Code/macsetup/payloads/zshrc $HOME/.zshrc
cp $HOME/Code/macsetup/payloads/sandbox.sh $HOME/sandbox.sh

/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/modules/node/install-user.sh)"
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/modules/python/install-user.sh)"
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/modules/ruby/install-user.sh)"

success "User environment setup complete for $USER"
