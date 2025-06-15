All python versions and venvs live in ~/.pyenv

Install a version with
```
pyenv install 3.12.3
```

Project setup, this process creates a repo and 'clones', or 'freezes' the python version so that from this point onward we always use this version. You can automate this so when you clone the repo it just works.
```
poetry init -n
poetry env use $(pyenv prefix 3.12.3)/bin/python
poetry install
```

Set up project tooling
```
poetry add --group dev black ruff pyright pytest
```

VSCode extensions
- ms-python.python
- ms-python.vscode-pylance
- charliermarsh.ruff
- ms-python.black-formatter

Put this vscode settings in each project
```
{
  "python.defaultInterpreterPath": "${workspaceFolder}/.venv/bin/python",
}
```

Run code with poetry
```
PYENV_VERSION=myapp-env poetry run python script.py
```

For taskfile, set
```
PYENV_ROOT: "$HOME/.pyenv"
PATH: "$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
PYENV_VERSION: "myapp-env"
```
