#!/bin/bash

# ==============================================
# TPM (Tmux Plugin Manager) Installation Script
# ==============================================

set -e  # Exit on any error

echo "🚀 Installing TPM (Tmux Plugin Manager)..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    echo -e "${RED}❌ Error: tmux is not installed${NC}"
    echo -e "${YELLOW}Please install tmux first:${NC}"
    echo "  macOS: brew install tmux"
    echo "  Ubuntu/Debian: sudo apt install tmux"
    echo "  CentOS/RHEL: sudo yum install tmux"
    exit 1
fi

echo -e "${BLUE}✅ Found tmux version: $(tmux -V)${NC}"

# Create tmux plugins directory if it doesn't exist
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ -d "$TPM_DIR" ]; then
    echo -e "${YELLOW}⚠️  TPM directory already exists. Removing old installation...${NC}"
    rm -rf "$TPM_DIR"
fi

echo -e "${BLUE}📁 Creating plugins directory...${NC}"
mkdir -p "$HOME/.tmux/plugins"

# Clone TPM repository
echo -e "${BLUE}📥 Cloning TPM from GitHub...${NC}"
git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"

# Make TPM executable
chmod +x "$TPM_DIR/tpm"

echo -e "${GREEN}✅ TPM installed successfully!${NC}"
echo ""
echo -e "${YELLOW}📋 Next steps:${NC}"
echo "1. Copy the tmux.conf to your home directory:"
echo "   cp tmux.conf ~/.tmux.conf"
echo ""
echo "2. Start a new tmux session:"
echo "   tmux new-session"
echo ""
echo "3. Install plugins by pressing: Ctrl+c then I (capital i)"
echo ""
echo "4. Reload configuration: Ctrl+c then r"
echo ""
echo -e "${GREEN}🎉 Setup complete! Enjoy your enhanced tmux experience!${NC}"