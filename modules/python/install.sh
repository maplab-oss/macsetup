#!/bin/zsh

set -e

brew install pipx pyenv
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init - zsh)"
pipx list | grep -q poetry || pipx install poetry
poetry config virtualenvs.in-project true

command -v uv >/dev/null 2>&1 || (curl -LsSf https://astral.sh/uv/install.sh | sh)
export PATH="$HOME/.cargo/bin:$PATH"

pyenv versions | grep -q "3.12.3" || pyenv install 3.12.3
pyenv global 3.12.3
