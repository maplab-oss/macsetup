# Macsetup

## Install

```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start.sh)"
```

If the repository already exists at `~/Code/macsetup`, you'll be prompted to override it. The script will warn you if there are uncommitted or unsaved changes that would be lost.

## Non-Admin User Setup

As admin, install system-wide dependencies:

```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start-admin.sh)"
```

As target user, set up user environment:

```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start-user.sh)"
```

## Uninstall

```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/uninstall.sh)"
```

The uninstall script will prompt for confirmation before removing the repository, especially if there are uncommitted changes that would be lost.

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
