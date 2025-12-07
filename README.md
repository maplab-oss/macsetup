# Macsetup

## Install

```
/bin/zsh -c "$(curl -fsSL "https://raw.githubusercontent.com/felixsebastian/macsetup/main/start.sh?$(date +%s)")"
```

### Install for a different user

If you need to install for a non-admin user, switch to an admin user account first, then run the script with the `--user` flag pointing to the target user:

```
/bin/zsh -c "$(curl -fsSL "https://raw.githubusercontent.com/felixsebastian/macsetup/main/start.sh?$(date +%s)")" -- --user targetuser
```

This will install all tools and configurations in the target user's home directory instead of the admin user's.

## Uninstall

```
/bin/zsh -c "$(curl -fsSL "https://raw.githubusercontent.com/felixsebastian/macsetup/main/uninstall.sh?$(date +%s)")"
```

### Uninstall for a different user

```
/bin/zsh -c "$(curl -fsSL "https://raw.githubusercontent.com/felixsebastian/macsetup/main/uninstall.sh?$(date +%s)")" -- --user targetuser
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

Example with `--user` flag:
```
~/Code/macsetup/install-module.sh python --user targetuser
```
