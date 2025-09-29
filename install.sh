#!/bin/bash

# ==============================================
# Tmux Catppuccin Setup - Complete Installation
# ==============================================

set -e  # Exit on any error

echo "🎨 Tmux Catppuccin Setup - Complete Installation"
echo "=================================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}📍 Installation directory: ${SCRIPT_DIR}${NC}"
echo ""

# Step 1: Install Nerd Font
echo -e "${YELLOW}Step 1/3: Installing JetBrains Mono Nerd Font...${NC}"
if "${SCRIPT_DIR}/scripts/install-nerd-font.sh"; then
    echo -e "${GREEN}✅ Font installation completed${NC}"
else
    echo -e "${RED}❌ Font installation failed${NC}"
    exit 1
fi
echo ""

# Step 2: Install TPM
echo -e "${YELLOW}Step 2/3: Installing TPM (Tmux Plugin Manager)...${NC}"
if "${SCRIPT_DIR}/scripts/install-tpm.sh"; then
    echo -e "${GREEN}✅ TPM installation completed${NC}"
else
    echo -e "${RED}❌ TPM installation failed${NC}"
    exit 1
fi
echo ""

# Step 3: Setup Configuration
echo -e "${YELLOW}Step 3/3: Setting up tmux configuration...${NC}"

# Backup existing config if it exists
if [ -f "$HOME/.tmux.conf" ]; then
    echo -e "${BLUE}📋 Backing up existing tmux.conf to ~/.tmux.conf.backup${NC}"
    cp "$HOME/.tmux.conf" "$HOME/.tmux.conf.backup"
fi

# Copy new configuration
echo -e "${BLUE}📝 Installing new tmux configuration...${NC}"
cp "${SCRIPT_DIR}/tmux.conf" "$HOME/.tmux.conf"

echo -e "${GREEN}✅ Configuration setup completed${NC}"
echo ""

# Final instructions
echo -e "${GREEN}🎉 Installation Complete!${NC}"
echo ""
echo -e "${YELLOW}📋 Next Steps:${NC}"
echo "1. Restart your terminal application"
echo "2. Set your terminal font to 'JetBrainsMono Nerd Font' (size 12-14pt)"
echo "3. Start a new tmux session:"
echo -e "   ${BLUE}tmux new-session${NC}"
echo ""
echo "4. Install tmux plugins:"
echo -e "   ${BLUE}Press: Ctrl+c then I (capital i)${NC}"
echo ""
echo "5. Reload configuration:"
echo -e "   ${BLUE}Press: Ctrl+c then r${NC}"
echo ""
echo -e "${YELLOW}🛠️  Terminal Font Configuration:${NC}"
echo "• iTerm2: Preferences → Profiles → Text → Font"
echo "• Terminal.app: Preferences → Profiles → Text → Font"
echo "• VS Code: Settings → Terminal › Integrated: Font Family"
echo ""
echo -e "${BLUE}💡 Key Bindings:${NC}"
echo "• Prefix: Ctrl+c"
echo "• Split horizontal: Ctrl+c then |"
echo "• Split vertical: Ctrl+c then -"
echo "• Navigate panes: Ctrl+c then h/j/k/l"
echo "• Reload config: Ctrl+c then r"
echo ""
echo -e "${GREEN}Enjoy your beautiful tmux setup! 🚀${NC}"