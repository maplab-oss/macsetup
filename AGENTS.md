# Macsetup

This repository automates the initial setup of a new Mac with essential developer tools and configurations. The philosophy is simplicity: the scripts are a direct, one-to-one mapping of the manual commands that would normally be run when setting up a fresh machine. There are no complex conditionals or elaborate error handling—just straightforward commands that install runtimes (Node.js, Python, Ruby), configure ZSH with Oh My Zsh, set up Homebrew, and copy configuration files like `.gitconfig` and `.zshrc`. Each module is self-contained and can be run independently, making it easy to understand and modify what gets installed.

For simplicity, it's assumed that you'll be running this on an Apple Silicon-based Mac with zsh already installed.

## Non-Admin User Setup

For non-admin users, the setup uses two scripts: `start-admin.sh` (installs Homebrew and system packages as admin) and `start-user.sh` (sets up user environment). The admin runs both, using `sudo -u targetuser` for the second. This ensures package managers (npm, pip, rbenv) install to the target user's home directory with correct ownership.

## Script Execution Philosophy

**Never assume a local script directory exists.** The root scripts (`start-admin.sh`, `start-user.sh`) are designed to be run directly from GitHub URLs, meaning there is no local clone of the repository at the time of execution. Module scripts and dependencies must therefore be fetched from URLs rather than referenced via relative paths.

**Prefer simplicity over optimization.** While we could check if a local file exists and fall back to URLs, this adds unnecessary complexity. Just always fetching from URLs is simpler, more predictable, and easier to maintain. The performance difference is negligible for the setup use case.

### Rules for Script References:

1. **Default to URL-based execution**: Unless there's an obvious benefit to using a local file, always fetch scripts from GitHub URLs using `curl` and execute them directly
2. **Never use `SCRIPT_DIR` or `REPO_ROOT`**: These variables assume a local directory structure that may not exist
3. **Source dependencies from URLs**: Use `source <(curl -fsSL https://raw.githubusercontent.com/...)` for shared libraries like `lib/output.sh`
4. **Call other scripts via URLs**: Use `/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/...)"` to execute other scripts

### Exceptions:

- **Uninstall scripts**: These are run locally after setup is complete, so they can use local paths if needed
- **Local utility scripts**: Scripts like `install-module.sh` and `uninstall.sh` are convenience wrappers meant to be run from a cloned repo and can use local paths
- **Payload files**: The `start-user.sh` script clones the repo specifically to access payload files (`.gitconfig`, `.zshrc`, etc.) that need to be copied to the user's home directory
