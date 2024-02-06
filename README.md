# My dotfiles
This repository contains the dotfiles for my systems

## Requirements
 - git
 - stow

## Installation
First, clone the dotfiles repo to your $HOME directory
```sh
git clone git@github.com/mtyszkiewicz/.dotfiles.git
cd .dotfiles
```

then, use GNU stow to create symlinks to any package
```sh
stow [--adopt] package_name
```

## Unlink
```sh
stow -D package_name
```

## Brew
for brew packages installation use
```sh
brew bundle --file ~/.dotfiles/brew/Brewfile
```

to update the bundle use
```sh
brew bundle dump --file ~/.dotfiles/brew/Brewfile
```