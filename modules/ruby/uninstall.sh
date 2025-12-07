#!/bin/zsh

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)" 2>/dev/null || true
rbenv uninstall -f 3.3.0 2>/dev/null || true
rm -rf $HOME/.rbenv

