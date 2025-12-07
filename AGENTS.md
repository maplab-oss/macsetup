# Macsetup

This repository automates the initial setup of a new Mac with essential developer tools and configurations. The philosophy is simplicity: the scripts are a direct, one-to-one mapping of the manual commands that would normally be run when setting up a fresh machine. There are no complex conditionals or elaborate error handling—just straightforward commands that install runtimes (Node.js, Python, Ruby), configure ZSH with Oh My Zsh, set up Homebrew, and copy configuration files like `.gitconfig` and `.zshrc`. Each module is self-contained and can be run independently, making it easy to understand and modify what gets installed.

For simplicity, it's assumed that you'll be running this on an Apple Silicon-based Mac with zsh already installed.

## Admin User Setup

To install for a non-admin user, an admin can use `sudo -u targetuser` to run the script as the target user. This automatically sets the `HOME` and `USER` environment variables correctly, and package managers (npm, pip, rbenv, etc.) install to the target user's home directory.
