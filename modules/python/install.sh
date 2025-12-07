#!/bin/zsh

set -e

brew install pipx pyenv
export PATH="$HOME/.local/bin:$PATH"
pipx list | grep -q poetry || pipx install poetry
poetry config virtualenvs.in-project true
