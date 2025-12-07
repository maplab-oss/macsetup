# Macsetup

## Install

```
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/felixsebastian/macsetup/main/start.sh)"
```

## Install for Non-Admin User

If you need to set up a non-admin user account, follow these manual steps as an admin:

1. Install Homebrew system-wide:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Create code directory for the target user:
```
sudo -u targetuser mkdir -p ~targetuser/Code
```

3. Install GitHub CLI and clone this repo:
```
brew install gh
sudo -u targetuser gh auth login
sudo -u targetuser gh repo clone felixsebastian/macsetup ~targetuser/Code/macsetup
```

4. Install Oh My Zsh for the target user:
```
sudo -u targetuser sh -c 'KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended'
```

5. Copy config files:
```
sudo -u targetuser cp ~targetuser/Code/macsetup/payloads/gitconfig ~targetuser/.gitconfig
sudo -u targetuser cp ~targetuser/Code/macsetup/payloads/zshrc ~targetuser/.zshrc
sudo -u targetuser cp ~targetuser/Code/macsetup/payloads/sandbox.sh ~targetuser/sandbox.sh
```

6. Install Homebrew packages:
```
brew install go-task/tap/go-task awscli tmux overmind
```

7. Run module installers as the target user:
```
sudo -u targetuser ~targetuser/Code/macsetup/modules/node/install.sh
sudo -u targetuser ~targetuser/Code/macsetup/modules/python/install.sh
sudo -u targetuser ~targetuser/Code/macsetup/modules/ruby/install.sh
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
