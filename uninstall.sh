#!/bin/bash
# Uninstall Loom

set -e

echo "Uninstalling Loom..."


INSTALL_DIR="/usr/local/lib/loom"
BIN_FILE="/usr/local/bin/loom"

# Remove installation directory
if [ -d "$INSTALL_DIR" ]; then
    echo "Removing installation directory..."
    sudo rm -rf "$INSTALL_DIR"
else
    echo "Installation directory not found: $INSTALL_DIR"
fi

# Remove binary wrapper
if [ -f "$BIN_FILE" ]; then
    echo "Removing loom command..."
    sudo rm "$BIN_FILE"
else
    echo "Loom command not found: $BIN_FILE"
fi

echo ""
echo "Loom uninstalled successfully!"
