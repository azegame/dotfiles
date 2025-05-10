#!/bin/zsh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CURSOR_SET_DIR="${HOME}/Library/Application Support/Cursor/User"

# Link settings.json
echo "Linking settings.json to cursor..."
ln -fsvn "${SCRIPT_DIR}/settings.json" "${CURSOR_SET_DIR}/settings.json"

# Install extensions using the cursor command
if command -v cursor >/dev/null 2>&1; then
  echo "Installing extensions..."

  installed=$(cursor --list-extensions)

  cat "${SCRIPT_DIR}/extensions" | while read -r ext; do
    if ! echo "$installed" | grep -qx "$ext"; then
      echo "Installing $ext..."
      cursor --install-extension "$ext"
    else
      echo "$ext is already installed, skipping."
    fi
  done
else
  echo "cursor command not found."
fi
