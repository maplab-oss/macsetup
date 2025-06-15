All python versions and venvs live in ~/.pyenv

Install a version with
```
pyenv install 3.12.3
```

Create a virtual env with
```
pyenv virtualenv 3.12.3 myapp-env
```

Activate this env with
```
export PYENV_VERSION=myapp-env
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
