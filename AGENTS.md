# Macsetup

This repository automates the initial setup of a new Mac with essential developer tools and configurations. The philosophy is simplicity: the scripts are a direct, one-to-one mapping of the manual commands that would normally be run when setting up a fresh machine. There are no complex conditionals or elaborate error handling—just straightforward commands that install runtimes (Node.js, Python, Ruby), configure ZSH with Oh My Zsh, set up Homebrew, and copy configuration files like `.gitconfig` and `.zshrc`. Each module is self-contained and can be run independently, making it easy to understand and modify what gets installed.

For simplicity, it's assumed that you'll be running this on an Apple Silicon-based Mac with zsh already installed.

## Non-Admin User Setup

For non-admin users, the setup uses two scripts: `start-admin.sh` (installs Homebrew and system packages as admin) and `start-user.sh` (sets up user environment). The admin runs both, using `sudo -u targetuser` for the second. This ensures package managers (npm, pip, rbenv) install to the target user's home directory with correct ownership.
