# .dotfiles

This repository contains my personal dotfiles managed with GNU Stow.

## Requirements

- [Homebrew](https://brew.sh/) (for macOS/Linux package management e.g. `brew install stow`)
- [GNU Stow](https://www.gnu.org/software/stow/)

## Usage

### Stow Commands

Link a package's config files:

```bash
stow package_name
```

Use `--adopt` to incorporate existing config files (this overwrites files in the repository with your current configs):

```bash
stow --adopt package_name
```

Unlink a package:

```bash
stow -D package_name
```

### Homebrew Management

Install packages from Brewfile:

```bash
brew bundle --file ~/.dotfiles/brew/Brewfile
```

Save current packages to Brewfile:

```bash
brew bundle dump --file ~/.dotfiles/brew/Brewfile
```