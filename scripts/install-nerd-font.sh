#!/bin/bash

# ==============================================
# JetBrains Mono Nerd Font Installation Script
# ==============================================

set -e  # Exit on any error

echo "🎨 Installing JetBrains Mono Nerd Font..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Detect operating system
OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${OS}"
esac

echo -e "${BLUE}🖥️  Detected OS: ${MACHINE}${NC}"

# Function to install on macOS
install_mac() {
    echo -e "${BLUE}🍎 Installing on macOS...${NC}"
    
    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null; then
        echo -e "${YELLOW}⚠️  Homebrew not found. Installing Homebrew first...${NC}"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    
    echo -e "${BLUE}📥 Installing JetBrains Mono Nerd Font via Homebrew...${NC}"
    brew tap homebrew/cask-fonts
    brew install --cask font-jetbrains-mono-nerd-font
    
    echo -e "${GREEN}✅ JetBrains Mono Nerd Font installed successfully on macOS!${NC}"
}

# Function to install on Linux
install_linux() {
    echo -e "${BLUE}🐧 Installing on Linux...${NC}"
    
    # Create fonts directory
    FONT_DIR="$HOME/.local/share/fonts"
    mkdir -p "$FONT_DIR"
    
    # Download and install font
    echo -e "${BLUE}📥 Downloading JetBrains Mono Nerd Font...${NC}"
    cd /tmp
    
    # Download the latest release
    FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
    curl -fLo JetBrainsMono.zip "$FONT_URL"
    
    echo -e "${BLUE}📦 Extracting fonts...${NC}"
    unzip -o JetBrainsMono.zip -d "$FONT_DIR/"
    
    # Update font cache
    echo -e "${BLUE}🔄 Updating font cache...${NC}"
    if command -v fc-cache &> /dev/null; then
        fc-cache -fv
    fi
    
    # Cleanup
    rm -f JetBrainsMono.zip
    
    echo -e "${GREEN}✅ JetBrains Mono Nerd Font installed successfully on Linux!${NC}"
}

# Install based on OS
case $MACHINE in
    Mac)
        install_mac
        ;;
    Linux)
        install_linux
        ;;
    *)
        echo -e "${RED}❌ Error: Unsupported operating system: ${MACHINE}${NC}"
        echo -e "${YELLOW}Please install JetBrains Mono Nerd Font manually:${NC}"
        echo "Visit: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono"
        exit 1
        ;;
esac

echo ""
echo -e "${YELLOW}📋 Next steps:${NC}"
echo "1. Restart your terminal application"
echo "2. Set JetBrains Mono Nerd Font as your terminal font"
echo "   - Font name: 'JetBrainsMono Nerd Font' or 'JetBrains Mono NL'"
echo "   - Recommended size: 12-14pt"
echo ""
echo -e "${BLUE}💡 Terminal Configuration:${NC}"
echo "• iTerm2: Preferences → Profiles → Text → Font"
echo "• Terminal.app: Preferences → Profiles → Text → Font"
echo "• VS Code: Settings → Terminal › Integrated: Font Family"
echo ""
echo -e "${GREEN}🎉 Font installation complete!${NC}"