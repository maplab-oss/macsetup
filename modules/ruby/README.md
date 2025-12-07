# Ruby Module

## Philosophy

This setup follows a **system-level tools, project-level environments** approach:

- **System level**: `rbenv` and `ruby-build` are installed globally. Ruby versions are managed by `rbenv` and stored in `~/.rbenv`. `bundler` is available as the package manager.
- **Project level**: Each project manages its own dependencies using Bundler. Dependencies can be installed in `.bundle` (local to the project) or using system-wide gems with project-specific Gemfile.lock.

## System Setup

Ruby versions are managed by `rbenv` and stored in `~/.rbenv`. The install script sets up a default Ruby version. To install additional versions:

```bash
rbenv install 3.3.6
rbenv global 3.3.6
```

List installed versions:

```bash
rbenv versions
```

List available versions:

```bash
rbenv install --list
```

Rehash rbenv shims (after installing gems with executables):

```bash
rbenv rehash
```

## Project Setup

Each project gets its own self-contained dependency management. This process pins the Ruby version for the project and installs all dependencies:

```bash
cd myproject
rbenv version | cut -d' ' -f1 > .ruby-version
bundle init
bundle install
```

This creates:
- `.ruby-version` file (pins the Ruby version via rbenv)
- `Gemfile` (project dependencies)
- `Gemfile.lock` (lock file for reproducible installs)

For local gem installation (recommended for project isolation):

```bash
bundle config set --local path 'vendor/bundle'
bundle install
```

This creates a `vendor/bundle/` directory containing all gems, fully isolated to the project.

Everything is self-contained in the project directory. When you clone a repo, running `rbenv install && bundle install` will use the correct Ruby version and install all dependencies.

## Adding Dependencies

Add a gem to your project:

```bash
bundle add rails
bundle add rspec --group development,test
```

Or manually edit `Gemfile`:

```ruby
source 'https://rubygems.org'

gem 'rails', '~> 7.1'
gem 'pg', '~> 1.5'

group :development, :test do
  gem 'rspec-rails'
  gem 'rubocop'
end
```

Then install:

```bash
bundle install
```

## Running Code

Run Ruby scripts with the project's Ruby version:

```bash
ruby script.rb
```

Run commands with the project's bundled gems:

```bash
bundle exec rails server
bundle exec rspec
bundle exec rubocop
```

Create binstubs for faster execution:

```bash
bundle binstubs rails rspec rubocop
./bin/rails server
./bin/rspec
```

## Editor Configuration

### VSCode Extensions
- Shopify.ruby-lsp
- KoichiSasada.vscode-rdbg
- kaiwood.endwise

### VSCode Settings

Add to `.vscode/settings.json` in each project:

```json
{
  "ruby.lsp.enabled": true,
  "ruby.format": "rubocop",
  "[ruby]": {
    "editor.defaultFormatter": "Shopify.ruby-lsp",
    "editor.formatOnSave": true
  }
}
```

### Taskfile Configuration

For Taskfile, ensure rbenv is initialized:

```yaml
env:
  PATH: "$HOME/.rbenv/shims:$PATH"
tasks:
  server:
    cmds:
      - eval "$(rbenv init - zsh)" && bundle exec rails server
  test:
    cmds:
      - eval "$(rbenv init - zsh)" && bundle exec rspec
```

## Common Workflows

### Setting up a new Rails project

```bash
gem install rails
rbenv rehash
rails new my-app --database=postgresql
cd my-app
rbenv version | cut -d' ' -f1 > .ruby-version
bundle config set --local path 'vendor/bundle'
bundle install
bundle exec rails server
```

### Setting up a new Ruby gem

```bash
bundle gem my_gem
cd my_gem
rbenv version | cut -d' ' -f1 > .ruby-version
bundle install
bundle exec rspec
```

### Working with existing projects

When you clone a repo with a `.ruby-version` file:

```bash
git clone https://github.com/user/project.git
cd project
rbenv install "$(cat .ruby-version)"
bundle install
bundle exec rails server
```

### Updating dependencies

Update all gems:

```bash
bundle update
```

Update specific gem:

```bash
bundle update rails
```

Check for outdated gems:

```bash
bundle outdated
```
