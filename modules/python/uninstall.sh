#!/bin/zsh

export PATH="$HOME/.local/bin:$PATH"
pipx uninstall poetry 2>/dev/null || true
rm -rf $HOME/.pyenv
rm -rf $HOME/.local
rm -rf $HOME/.cargo
rm -rf $HOME/.config/pypoetry

