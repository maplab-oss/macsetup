# Macsetup

## Install

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start.sh)"
```

### Install for a different user

When running as an admin user, you can install for a different user by specifying the `--user` flag:

```
./start.sh --user targetuser
```

This will install all tools and configurations in the target user's home directory instead of the admin user's.

## Uninstall

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/uninstall.sh)"
```
