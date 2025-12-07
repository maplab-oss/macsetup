# Macsetup

## Install

```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start.sh)"
```

### Install for a different user

If you need to install for a non-admin user, run as an admin with the `--user` flag:

```
sudo /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start.sh)" -- --user targetuser
```

This installs tools in the target user's home directory with correct ownership.

## Uninstall

```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/uninstall.sh)"
```

### Uninstall for a different user

```
sudo /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/uninstall.sh)" -- --user targetuser
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
sudo ~/Code/macsetup/install-module.sh python --user targetuser
```
