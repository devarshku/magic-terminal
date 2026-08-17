#!/usr/bin/env bash

set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up dotfiles from $DOTFILES"

backup_file() {
  local file="$1"

  if [[ -e "$file" && ! -L "$file" ]]; then
    echo "Backing up $file -> ${file}.backup"
    mv "$file" "${file}.backup"
  fi
}

link_file() {
  local source="$1"
  local target="$2"

  backup_file "$target"

  echo "Linking $target -> $source"
  ln -sfn "$source" "$target"
}

link_file "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

echo
echo "Dotfiles installed successfully."
echo "Restart your shell or run:"
echo "exec zsh"