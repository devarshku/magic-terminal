#!/usr/bin/env bash

set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up dotfiles from $DOTFILES"

OS="$(uname -s)"

case "$OS" in
  Darwin)
    echo "Detected macOS"
    "$DOTFILES/macos/install.sh"
    ;;
  Linux)
    echo "Detected Linux"

    if [[ -f /etc/os-release ]]; then
      . /etc/os-release
    fi

    if [[ "${ID:-}" == "ubuntu" || "${ID_LIKE:-}" == *"ubuntu"* || "${ID_LIKE:-}" == *"debian"* ]]; then
      "$DOTFILES/ubuntu/install.sh"
    else
      echo "Unsupported Linux distribution."
      echo "This setup currently supports Ubuntu/Debian-based systems."
      exit 1
    fi
    ;;
  *)
    echo "Unsupported operating system: $OS"
    exit 1
    ;;
esac

backup_file() {
  local file="$1"

  if [[ -e "$file" && ! -L "$file" ]]; then
    local backup="${file}.backup"

    if [[ -e "$backup" ]]; then
      backup="${file}.backup.$(date +%Y%m%d%H%M%S)"
    fi

    echo "Backing up $file -> $backup"
    mv "$file" "$backup"
  fi
}

link_file() {
  local source="$1"
  local target="$2"

  if [[ ! -e "$source" ]]; then
    echo "Source file does not exist: $source"
    exit 1
  fi

  backup_file "$target"

  echo "Linking $target -> $source"
  ln -sfn "$source" "$target"
}

link_file "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

echo
echo "Dotfiles installed successfully."
echo "Restart your terminal or run:"
echo "exec zsh"