#!/bin/bash
# Uninstall Loom

set -e

echo "🧵 Uninstalling Loom..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "⚠️  This script needs sudo access to uninstall"
    echo "   Re-running with sudo..."
    sudo "$0" "$@"
    exit $?
fi

INSTALL_DIR="/usr/local/lib/loom"
BIN_FILE="/usr/local/bin/loom"

# Remove installation directory
if [ -d "$INSTALL_DIR" ]; then
    echo "🗑️  Removing installation directory..."
    rm -rf "$INSTALL_DIR"
else
    echo "⚠️  Installation directory not found: $INSTALL_DIR"
fi

# Remove binary wrapper
if [ -f "$BIN_FILE" ]; then
    echo "🗑️  Removing loom command..."
    rm "$BIN_FILE"
else
    echo "⚠️  Loom command not found: $BIN_FILE"
fi

echo ""
echo "✅ Loom uninstalled successfully!"
