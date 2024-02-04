# .dotfiles

Link:
```sh
cd ~/dotfiles/
stow package_name
```

Unlink:
```sh
cd ~/dotflies/
stow -D package_name
```

Brew:
```sh
# Install packages
brew bundle install --file ~/.dotfiles/brew/Brewfile

# Dump to Brewfile
brew bundle dump --file ~/.dotfiles/brew/Brewfile
```