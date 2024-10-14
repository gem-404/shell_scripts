#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'


header() {
    echo -e "\n\e[00;32m====================== $1 =======================\e[00m\n"
}

# Check if stow exists
is_installed() {
    pacman -Q "$1" &> /dev/null
}

if ! is_installed stow; then
    echo -e "\e[00;31mError: stow is not installed on this machine, please install it before proceeding\e[00m\n"
    exit 1
fi

header "Cleaning Home Dir"

mkdir -p ~/.dotfiles

dotfiles_folder=/home/gem-404/.dotfiles

declare -a files=(
    "/home/gem-404/.bash_history"
    "/home/gem-404/.bash_logout"
    "/home/gem-404/.bash_profile"
    "/home/gem-404/.bashrc"
    "/home/gem-404/.BurpSuite"
    "/home/gem-404/.cache"
    "/home/gem-404/.cargo"
    "/home/gem-404/.codeium"
    "/home/gem-404/.config"
    "/home/gem-404/.dart-tool"
    "/home/gem-404/.dmrc"
    "/home/gem-404/.elan_data"
    "/home/gem-404/.face"
    "/home/gem-404/.fehbg"
    "/home/gem-404/.flutter"
    "/home/gem-404/.gitconfig"
    "/home/gem-404/.git-credentials"
    "/home/gem-404/.gnupg"
    "/home/gem-404/.gradle"
    "/home/gem-404/.gtkrc-2.0"
    "/home/gem-404/.hushlogin"
    "/home/gem-404/.icons"
    "/home/gem-404/.ipynb_checkpoints"
    "/home/gem-404/.ipython"
    "/home/gem-404/.java"
    "/home/gem-404/.john"
    "/home/gem-404/.jupyter"
    "/home/gem-404/.local"
    "/home/gem-404/.lyrics"
    "/home/gem-404/.maltego"
    "/home/gem-404/.mariadb_history"
    "/home/gem-404/.markdown-reader"
    "/home/gem-404/.miracle-sink.history"
    "/home/gem-404/.miracle-wifi.history"
    "/home/gem-404/.mozilla"
    "/home/gem-404/.mpd"
    "/home/gem-404/.mplayer"
    "/home/gem-404/.ncmpcpp"
    "/home/gem-404/.node_repl_history"
    "/home/gem-404/.npm"
    "/home/gem-404/.npm-global"
    "/home/gem-404/.npmrc"
    "/home/gem-404/.oh-my-zsh"
    "/home/gem-404/.ollama"
    "/home/gem-404/.pki"
    "/home/gem-404/.pub-cache"
    "/home/gem-404/.python_history"
    "/home/gem-404/.RData"
    "/home/gem-404/.Rhistory"
    "/home/gem-404/.RiceBackup"
    "/home/gem-404/.rsf_history"
    "/home/gem-404/.rustup"
    "/home/gem-404/.sqlite_history"
    "/home/gem-404/.ssh"
    "/home/gem-404/.ssr"
    "/home/gem-404/.subversion"
    "/home/gem-404/.TinyTeX"
    "/home/gem-404/.tmux"
    "/home/gem-404/.viminfo"
    "/home/gem-404/.vim_mru_files"
    "/home/gem-404/.vimrc"
    "/home/gem-404/.vim_runtime"
    "/home/gem-404/.wget-hsts"
    "/home/gem-404/.zcompdump"
    "/home/gem-404/.zcompdump-gem-404-5.9"
    "/home/gem-404/.zcompdump-gem-404-5.9.zwc"
    "/home/gem-404/.zsh_history"
    "/home/gem-404/.zshrc"
    "/home/gem-404/.zshrc-history"
)

cd $dotfiles_folder || exit

for file in "${files[@]}"; do

    if [[ -f "/home/gem-404/$file" ]]; then

        mkdir -p "$dotfiles_folder/${file#./}"

        mv "/home/gem-404/$file" "$dotfiles_folder/${file#./}/"

        ln -s "$dotfiles_folder/${file}" "/home/gem-404/$file"

    else
        
        echo -e "\n\e[00;31mFile Does Not Exist: $file\e[00m"

    fi

done

header "Finished Cleaning Home Dir"
