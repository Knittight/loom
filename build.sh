#!/bin/bash
# Install Loom system-wide so it works like python3

set -e

echo "Installing Loom system-wide..."

INSTALL_DIR="/usr/local/lib/loom"
BIN_DIR="/usr/local/bin"

# Create installation directory
echo "Creating installation directory..."
sudo mkdir -p "$INSTALL_DIR"

# Copy the interpreter
echo "Copying Loom interpreter..."
sudo cp main.py "$INSTALL_DIR/loom.py"
sudo chmod +x "$INSTALL_DIR/loom.py"

# Create wrapper script
echo "Creating loom command..."
cat > "$BIN_DIR/loom" << 'EOF'
#!/bin/bash
# Loom interpreter wrapper

LOOM_PATH="/usr/local/lib/loom/loom.py"

# If no arguments, show usage
if [ $# -eq 0 ]; then
    echo "usage: loom <file.lm> [args...]"
    exit 1
fi

# Run the interpreter
exec python3 "$LOOM_PATH" "$@"
EOF

chmod +x "$BIN_DIR/loom"

echo ""
echo "Loom installed successfully!"
echo ""
echo "Installation locations:"
echo "   Library: $INSTALL_DIR/loom.py"
echo "   Command: $BIN_DIR/loom"
echo ""
echo "You can now run:"
echo "   loom myprogram.lm     # From anywhere!"
echo ""
echo "Test it:"
echo "   echo 'print(\"Hello, Loom!\")' > test.lm"
echo "   loom test.lm"