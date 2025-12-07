# Macsetup

This repository automates the initial setup of a new Mac with essential developer tools and configurations. The philosophy is simplicity: the scripts are a direct, one-to-one mapping of the manual commands that would normally be run when setting up a fresh machine. There are no complex conditionals or elaborate error handling—just straightforward commands that install runtimes (Node.js, Python, Ruby), configure ZSH with Oh My Zsh, set up Homebrew, and copy configuration files like `.gitconfig` and `.zshrc`. Each module is self-contained and can be run independently, making it easy to understand and modify what gets installed.

For simplicity, it's assumed that you'll be running this on an Apple Silicon-based Mac with zsh already installed.

## Admin User Setup

The `--user` flag allows an admin user to install tools for a non-admin user by setting the `HOME` and `USER` environment variables to point to the target user's home directory. This works because package managers (npm, pip, rbenv, etc.) respect the `HOME` environment variable when determining where to install files.
