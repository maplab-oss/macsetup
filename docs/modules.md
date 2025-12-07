# Module Philosophy and Structure

## Philosophy

All runtime modules follow a **system-level tools, project-level environments** approach:

- **System level**: Version managers, package managers, and tooling are installed globally. These tools provide the infrastructure for managing multiple versions and dependencies.
- **Project level**: Each project manages its own runtime version and dependencies in a self-contained directory (e.g., `.venv`, `node_modules`, `.bundle`). Everything needed for the project lives in the project folder.

This approach provides:
- **Flexibility**: Developers can work on multiple projects with different runtime versions simultaneously
- **Reproducibility**: Projects are self-contained and can be easily cloned and set up
- **Isolation**: Dependencies are isolated per project, preventing conflicts
- **Simplicity**: System-level tools handle the complexity, projects stay simple

## Module Structure

Each module in `modules/<name>/` should contain:

### `install.sh`
Installs system-level tools and sets up the initial environment. Should:
- Install version managers and package managers via Homebrew or official installers
- Configure global settings (e.g., in-project virtual environments)
- Install a default runtime version
- Set up any necessary PATH exports for the installation script itself

### `zshrc`
Exports environment variables and initializes tools for the shell. Should:
- Export tool-specific root directories (e.g., `PYENV_ROOT`, `RBENV_ROOT`)
- Initialize version managers (e.g., `eval "$(pyenv init - zsh)"`)
- Add tool binaries to PATH
- Keep it minimal—only what's needed for the shell

### `uninstall.sh`
Removes the module's system-level installations. Should:
- Uninstall package managers
- Remove version manager directories
- Clean up any global configurations

### `README.md`
Documents how to use the module for project setup. Should follow this structure:

## README Structure

### Philosophy Section
Explain the system-level vs project-level approach in language-specific terms:

```markdown
## Philosophy

This setup follows a **system-level tools, project-level environments** approach:

- **System level**: [Version manager] and [package managers] are installed globally. 
  Runtime versions are managed by [version manager] and stored in [location].
- **Project level**: Each project has its own self-contained [environment directory] 
  containing the runtime interpreter and all dependencies. Everything needed for 
  the project lives in the project folder.
```

### System Setup Section
Document how to manage runtime versions at the system level:

```markdown
## System Setup

Runtime versions are managed by [version manager] and stored in [location]. 
The install script sets up [default version] as the default. To install additional versions:

```
[version manager] install [version]
[version manager] global [version]
```
```

### Project Setup Section
Provide clear, step-by-step instructions for setting up a new project:

```markdown
## Project Setup

Each project gets its own self-contained [environment directory]. This process 
pins the runtime version for the project and creates an environment with all dependencies:

```
cd myproject
[version manager] local [version]
[package manager] init
[package manager] install
```

This creates:
- `.[version-file]` file (pins the runtime version)
- `[environment-dir]/` directory (contains runtime interpreter and all dependencies)
- `[config-file]` (project configuration and dependencies)

Everything is self-contained in the project directory. When you clone a repo, 
running `[package manager] install` will recreate the environment with the correct 
runtime version and dependencies.
```

If multiple package managers are supported, show examples for each.

### Adding Dependencies Section
Show how to add dependencies to a project:

```markdown
## Adding Dependencies

Set up project tooling:
```
[package manager] add [dev-flag] [tools]
```
```

### Running Code Section
Show how to execute code using the project's environment:

```markdown
## Running Code

Run code with [package manager] (uses the project's environment):
```
[package manager] run [command]
```
```

### Editor Configuration Section
Document editor integration, including:

#### Extensions/Plugins
List recommended editor extensions:

```markdown
### VSCode Extensions
- extension-id-1
- extension-id-2
```

#### Editor Settings
Show project-specific settings that need to be configured:

```markdown
### VSCode Settings

Add to `.vscode/settings.json` in each project:
```
{
  "[language].defaultInterpreterPath": "${workspaceFolder}/[path-to-interpreter]",
}
```
```

### Environment Variables Section
Document any environment variables that need to be set for:
- Task runners (Taskfile, Make, etc.)
- CI/CD pipelines
- Development tools

```markdown
### Taskfile Configuration

For Taskfile, set:
```
[ENV_VAR]: "[value]"
PATH: "[tool-paths]:$PATH"
```
```

## Best Practices

1. **Keep it simple**: Each file should do one thing well
2. **Be explicit**: Show exact commands, don't assume knowledge
3. **Document alternatives**: If multiple package managers are supported, show both
4. **Editor-agnostic**: While VSCode is common, mention other editors when relevant
5. **Project-focused**: The README should focus on project setup, not system administration
6. **Self-contained**: Each project should work independently after setup

## Example Module Checklist

When creating a new module, ensure:

- [ ] `install.sh` installs system-level tools
- [ ] `install.sh` sets up a default runtime version
- [ ] `zshrc` initializes version managers properly
- [ ] `zshrc` adds necessary paths
- [ ] `uninstall.sh` cleans up system-level installations
- [ ] `README.md` explains the philosophy
- [ ] `README.md` shows system setup commands
- [ ] `README.md` provides clear project setup steps
- [ ] `README.md` documents editor integration
- [ ] `README.md` lists necessary environment variables
- [ ] All commands in README are tested and work

