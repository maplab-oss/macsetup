# Macsetup

## Install

```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start.sh)"
```

### Install for a different user

```
sudo -u targetuser /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start.sh)"
```

## Uninstall

```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/uninstall.sh)"
```

### Uninstall for a different user

```
sudo -u targetuser /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/uninstall.sh)"
```

## Module Commands

For testing or reinstalling individual modules (requires repo at `~/Code/macsetup`):

Install a module:
```
~/Code/macsetup/install-module.sh python
```

Uninstall a module:
```
~/Code/macsetup/uninstall-module.sh python
```

Example for a different user:
```
sudo -u targetuser ~/Code/macsetup/install-module.sh python
```
