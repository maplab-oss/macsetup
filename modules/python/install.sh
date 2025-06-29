#!/bin/zsh

set -e

brew install pipx pyenv
export PATH="$HOME/.local/bin:$PATH"
pipx install poetry
poetry config virtualenvs.in-project true
