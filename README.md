# Magic Terminal

My portable terminal configuration for macOS and Ubuntu.

This repository configures a consistent Zsh terminal environment across my machines using:

* Zsh
* Powerlevel10k
* MesloLGS Nerd Font
* zsh-autosuggestions
* zsh-syntax-highlighting

The configuration is managed through symlinks, so changes made to the files in this repository are automatically reflected in the active shell configuration.

## Repository structure

```text
magic-terminal/
├── install.sh
├── macos/
│   └── install.sh
├── ubuntu/
│   └── install.sh
└── zsh/
    ├── .zshrc
    └── .p10k.zsh
```

## Installation

Clone the repository:

```bash
git clone git@github.com:YOUR_GITHUB_USERNAME/magic-terminal.git
cd magic-terminal
```

Run the installer:

```bash
./install.sh
```

The installer automatically detects the operating system.

On macOS, it installs the required packages using Homebrew.

On Ubuntu, it installs the required packages using `apt` and installs Powerlevel10k directly from GitHub.

After installation, restart the shell:

```bash
exec zsh
```

## macOS

The macOS setup requires Homebrew.

Install Homebrew first if it is not already installed.

Then run:

```bash
./install.sh
```

The following packages are installed:

```text
zsh
powerlevel10k
zsh-autosuggestions
zsh-syntax-highlighting
font-meslo-lg-nerd-font
```

## Ubuntu

Run:

```bash
./install.sh
```

The Ubuntu installer installs:

```text
zsh
git
curl
wget
fontconfig
zsh-autosuggestions
zsh-syntax-highlighting
```

Powerlevel10k is installed into:

```text
~/.powerlevel10k
```

MesloLGS Nerd Fonts are installed into:

```text
~/.local/share/fonts
```

If Zsh is not your default shell, run:

```bash
chsh -s "$(command -v zsh)"
```

Then log out and log back in.

## Configuration

The repository contains the source versions of:

```text
zsh/.zshrc
zsh/.p10k.zsh
```

The installer creates symlinks:

```text
~/.zshrc -> <repo>/zsh/.zshrc
~/.p10k.zsh -> <repo>/zsh/.p10k.zsh
```

This means that editing:

```bash
nano zsh/.zshrc
```

also changes the configuration used by your shell.

## Powerlevel10k

To reconfigure the prompt:

```bash
p10k configure
```

Powerlevel10k writes its configuration to:

```text
~/.p10k.zsh
```

Because this file is symlinked into this repository, the changes can be committed directly.

After changing the prompt:

```bash
git add zsh/.p10k.zsh
git commit -m "Update Powerlevel10k configuration"
git push
```

## Machine-specific configuration

Machine-specific or private configuration should not be committed to this repository.

The shared `.zshrc` loads the following file when it exists:

```text
~/.zshrc.local
```

This can be used for things such as:

```bash
export WORKSPACE="$HOME/Documents/Code"
export SOME_API_KEY="..."
```

Do not commit API keys, passwords, tokens, SSH private keys, or other credentials to this repository.

## Updating

After making configuration changes:

```bash
git add .
git commit -m "Update terminal configuration"
git push
```

On another machine:

```bash
cd /path/to/magic-terminal
git pull
exec zsh
```

## New machine setup

For a new Mac or Ubuntu machine:

```bash
git clone git@github.com:YOUR_GITHUB_USERNAME/magic-terminal.git
cd magic-terminal
./install.sh
exec zsh
```

If GitHub SSH authentication has not yet been configured on the new machine, clone using HTTPS first or configure your SSH key before cloning.
