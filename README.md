# Macsetup

## Install

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start.sh)"
```

### Install for a different user

If you need to install for a non-admin user, switch to an admin user account first, then run the script with the `--user` flag pointing to the target user:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start.sh)" -- --user targetuser
```

This will install all tools and configurations in the target user's home directory instead of the admin user's.

## Uninstall

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/uninstall.sh)"
```

### Uninstall for a different user

To uninstall for a different user, use the `--user` flag:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/uninstall.sh)" -- --user targetuser
```
