#!/bin/bash
set -euo pipefail

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install all packages from Brewfile
brew bundle --file="$(dirname "$0")/Brewfile"

# Stow dotfiles (stow is now guaranteed by the Brewfile)
stow bash -t $HOME
stow git -t $HOME
stow zsh -t $HOME

# Taken from https://github.com/zellwk/dotfiles/blob/master/install-zsh.sh
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

clone_if_missing() {
    local dir="$1" url="$2"
    [[ -d "$dir" ]] || git clone "$url" "$dir"
}

# Installs plugins
clone_if_missing "$ZSH_CUSTOM/plugins/zsh-autosuggestions"      https://github.com/zsh-users/zsh-autosuggestions
clone_if_missing "$ZSH_CUSTOM/plugins/zsh-completions"          https://github.com/zsh-users/zsh-completions
clone_if_missing "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"  https://github.com/zsh-users/zsh-syntax-highlighting

# Fix permissions
chmod 700 "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
