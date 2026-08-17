#!/usr/bin/env bash

set -e

echo "Installing Ubuntu terminal dependencies..."

sudo apt update

sudo apt install -y \
  zsh \
  git \
  curl \
  wget \
  fontconfig \
  zsh-autosuggestions \
  zsh-syntax-highlighting

echo
echo "Installing Powerlevel10k..."

if [[ ! -d "$HOME/.powerlevel10k" ]]; then
  git clone --depth=1 \
    https://github.com/romkatv/powerlevel10k.git \
    "$HOME/.powerlevel10k"
else
  echo "Powerlevel10k already installed."
fi

echo
echo "Installing Meslo Nerd Font..."

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

BASE_URL="https://github.com/romkatv/powerlevel10k-media/raw/master"

fonts=(
  "MesloLGS NF Regular.ttf"
  "MesloLGS NF Bold.ttf"
  "MesloLGS NF Italic.ttf"
  "MesloLGS NF Bold Italic.ttf"
)

for font in "${fonts[@]}"; do
  encoded_font="${font// /%20}"

  if [[ ! -f "$FONT_DIR/$font" ]]; then
    curl -fLo "$FONT_DIR/$font" \
      "$BASE_URL/$encoded_font"
  else
    echo "$font already installed."
  fi
done

fc-cache -f

echo
echo "Ubuntu dependencies installed."

if [[ "$SHELL" != *"zsh" ]]; then
  echo
  echo "Your current default shell is: $SHELL"
  echo "To make zsh your default shell, run:"
  echo "chsh -s \"$(command -v zsh)\""
fi