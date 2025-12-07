#!/bin/zsh

set -e

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init - zsh)"
pipx list | grep -q poetry || pipx install poetry
poetry config virtualenvs.in-project true

command -v uv >/dev/null 2>&1 || (curl -LsSf https://astral.sh/uv/install.sh | sh)
export PATH="$HOME/.cargo/bin:$PATH"

pyenv install 3:latest || true
pyenv global $(pyenv versions --bare | tail -1)

