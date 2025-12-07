# Macsetup

This repository automates the initial setup of a new Mac with essential developer tools and configurations. The philosophy is simplicity: the scripts are a direct, one-to-one mapping of the manual commands that would normally be run when setting up a fresh machine. There are no complex conditionals or elaborate error handling—just straightforward commands that install runtimes (Node.js, Python, Ruby), configure ZSH with Oh My Zsh, set up Homebrew, and copy configuration files like `.gitconfig` and `.zshrc`. Each module is self-contained and can be run independently, making it easy to understand and modify what gets installed.

For simplicity, it's assumed that you'll be running this on an Apple Silicon-based Mac with zsh already installed.

## Admin User Setup

To install for a non-admin user, an admin uses `sudo -u targetuser` to run the script as the target user. The admin needs sudo privileges to run this command, but the target user doesn't need to be an admin. This automatically sets HOME/USER correctly, and all files are created with the target user's ownership.
