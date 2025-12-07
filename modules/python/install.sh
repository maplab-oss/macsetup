#!/bin/zsh

set -e

sudo brew install pipx pyenv
export PATH="$HOME/.local/bin:$PATH"
pipx install poetry
poetry config virtualenvs.in-project true
