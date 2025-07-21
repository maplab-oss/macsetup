# Ruby Module

Install new Ruby versions:

```
rbenv install ruby-x.x.x
rbenv global ruby-x.x.x
```

List available versions:
```
rbenv install --list
```

In project env
```
export PATH="/opt/homebrew/bin:$PATH"
eval "$(rbenv init - zsh)"
rbenv install "$(cat .ruby-version)"
```