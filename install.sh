#!/bin/bash
DOTFILES="$HOME/dotfiles"

# simbolic link
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/nvim" "$HOME/.config/nvim"
ln -sf "$DOTFILES/ghostty" "$HOME/.config/ghostty"
ln -sf "$DOTFILES/starship.toml" "$HOME/.config/starship.toml"
