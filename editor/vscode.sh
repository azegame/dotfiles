#!/bin/zsh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VSCODE_SET_DIR="${HOME}/Library/Application Support/Code/User"

# Link settings.json
echo "Linking settings.json to vscode..."
ln -fsvn "${SCRIPT_DIR}/settings.json" "${VSCODE_SET_DIR}/settings.json"

# Install extensions using the code command
if command -v code >/dev/null 2>&1; then
  echo "Installing extensions..."

  installed=$(code --list-extensions)

  cat "${SCRIPT_DIR}/extensions" | while read -r ext; do
    if ! echo "$installed" | grep -qx "$ext"; then
      echo "Installing $ext..."
      code --install-extension "$ext"
    else
      echo "$ext is already installed, skipping."
    fi
  done
else
  echo "Code command not found."
fi
