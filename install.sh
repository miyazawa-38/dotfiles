#!/bin/bash
DOTFILES="$HOME/dotfiles"

# simbolic link
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/nvim" "$HOME/.config/nvim"
