# Macsetup

## Install

```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/maplab-oss/macsetup/main/start.sh)"
```

The install script assumes you're running it as the admin user on the machine. If the repository already exists at `~/Code/macsetup`, you'll be prompted to override it. The script will warn you if there are uncommitted or unsaved changes that would be lost.

## Uninstall

```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/maplab-oss/macsetup/main/uninstall.sh)"
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
