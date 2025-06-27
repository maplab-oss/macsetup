#!/bin/zsh

set -e

brew install pipx pyenv;
pipx ensurepath;
pipx install poetry;
poetry config virtualenvs.in-project true;
