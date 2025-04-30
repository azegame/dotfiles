#!/bin/zsh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Create a symbolic link for dotfiles..."
for dotfile in "${SCRIPT_DIR}"/.??* ; do
    [[ "$dotfile" == "${SCRIPT_DIR}/.git" ]] && continue
    [[ "$dotfile" == "${SCRIPT_DIR}/.github" ]] && continue
    [[ "$dotfile" == "${SCRIPT_DIR}/.DS_Store" ]] && continue

    ln -fnsv "$dotfile" "$HOME"
done

source ~/.zshrc
