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
