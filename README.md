# Macsetup

## Install

```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start.sh)"
```

## Non-Admin User Setup

For non-admin users, run two scripts:

1. As admin, install system-wide dependencies:
```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start-admin.sh)"
```

2. As target user, set up user environment:
```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start-user.sh)"
```

## Uninstall

```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/uninstall.sh)"
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
