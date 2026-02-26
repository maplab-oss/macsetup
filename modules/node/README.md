# Node.js Module

## Philosophy

This setup follows a **system-level tools, project-level environments** approach:

- **System level**: `nvm` is installed globally. Node.js versions are managed by `nvm` and stored in `~/.nvm`. `pnpm` is available as the package manager.
- **Project level**: Each project has its own self-contained `node_modules` directory containing all dependencies. Everything needed for the project lives in the project folder.

## System Setup

Node.js versions are managed by `nvm` and stored in `~/.nvm`. The install script sets up the latest LTS version as the default. To install additional versions:

```bash
nvm install --lts
nvm install 18
nvm alias default lts/*
```

List installed versions:

```bash
nvm list
```

List available versions:

```bash
nvm list-remote
```

## Project Setup

Each project gets its own self-contained `node_modules` directory. This process pins the Node.js version for the project and installs all dependencies:

```bash
cd myproject
node --version > .nvmrc
nvm use
pnpm init
pnpm install
```

This creates:
- `.nvmrc` file (pins the Node.js version via nvm)
- `node_modules/` directory (contains all dependencies)
- `package.json` (project configuration and dependencies)
- `pnpm-lock.yaml` (lock file for reproducible installs)

Everything is self-contained in the project directory. When you clone a repo, running `nvm use && pnpm install` will use the correct Node.js version and install all dependencies.

## Adding Dependencies

Add production dependencies:

```bash
pnpm add react react-dom
```

Add development dependencies:

```bash
pnpm add -D typescript @types/node eslint prettier
```

## Running Code

Run scripts defined in `package.json`:

```bash
pnpm run dev
pnpm run build
pnpm run test
```

Execute Node.js directly:

```bash
node index.js
```

Run TypeScript files with tsx:

```bash
pnpm add -D tsx
pnpm tsx src/index.ts
```

## Editor Configuration

### VSCode Extensions
- dbaeumer.vscode-eslint
- esbenp.prettier-vscode
- ms-vscode.vscode-typescript-next
- bradlc.vscode-tailwindcss (for Tailwind CSS projects)

### VSCode Settings

Add to `.vscode/settings.json` in each project:

```json
{
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  },
  "typescript.tsdk": "node_modules/typescript/lib"
}
```

### Taskfile Configuration

For Taskfile, ensure nvm is initialized:

```yaml
env:
  NVM_DIR: "$HOME/.nvm"
tasks:
  dev:
    cmds:
      - source $NVM_DIR/nvm.sh && nvm use && pnpm run dev
```

## Common Workflows

### Setting up a new React project

```bash
pnpm create vite@latest my-app --template react-ts
cd my-app
node --version > .nvmrc
nvm use
pnpm install
pnpm add -D eslint prettier
pnpm run dev
```

### Setting up a new Node.js backend

```bash
mkdir my-api && cd my-api
node --version > .nvmrc
nvm use
pnpm init
pnpm add express
pnpm add -D typescript @types/node @types/express tsx nodemon
pnpm tsc --init
```

### Switching Node.js versions

Every time you enter a project directory with an `.nvmrc` file:

```bash
nvm use
```

To automatically switch versions, add this to your `.zshrc`:

```bash
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
```
