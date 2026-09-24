#!/bin/bash
DOTFILES="$HOME/dotfiles"

# simbolic link
ln -sfn "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sfn "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
ln -sfn "$DOTFILES/nvim" "$HOME/.config/nvim"
ln -sfn "$DOTFILES/ghostty" "$HOME/.config/ghostty"
ln -sfn "$DOTFILES/starship.toml" "$HOME/.config/starship.toml"
ln -sfn "$DOTFILES/karabiner" "$HOME/.config/karabiner"
