#!/usr/bin/env bash

set -e

echo "Installing macOS terminal dependencies..."

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is not installed."
  echo "Install it first from https://brew.sh and rerun this script."
  exit 1
fi

brew install \
  zsh \
  powerlevel10k \
  zsh-autosuggestions \
  zsh-syntax-highlighting

brew install --cask font-meslo-lg-nerd-font

echo
echo "macOS dependencies installed."