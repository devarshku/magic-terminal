# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load Powerlevel10k
if [[ "$(uname)" == "Darwin" ]]; then
  # macOS / Homebrew
  if command -v brew >/dev/null 2>&1; then
    source "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"
  fi
elif [[ "$(uname)" == "Linux" ]]; then
  # Ubuntu / Linux
  if [[ -f /usr/share/powerlevel10k/powerlevel10k.zsh-theme ]]; then
    source /usr/share/powerlevel10k/powerlevel10k.zsh-theme
  elif [[ -f "$HOME/.powerlevel10k/powerlevel10k.zsh-theme" ]]; then
    source "$HOME/.powerlevel10k/powerlevel10k.zsh-theme"
  fi
fi

# Powerlevel10k config
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

# zsh-autosuggestions
if [[ "$(uname)" == "Darwin" ]] && command -v brew >/dev/null 2>&1; then
  [[ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && \
    source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
elif [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# zsh-syntax-highlighting
if [[ "$(uname)" == "Darwin" ]] && command -v brew >/dev/null 2>&1; then
  [[ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && \
    source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
elif [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Optional machine-specific config
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"