# 🎨 Tmux Catppuccin Setup

A beautiful, feature-rich tmux configuration using the Catppuccin theme with comprehensive system monitoring and elegant window management.

![Preview](assets/preview.png)

## ✨ Features

### 🎯 Status Bar Components
- 📁 **Directory** - Current working directory
- 🎯 **Application** - Active application name  
- 📱 **Session** - Session name with prefix key indicator
- 💻 **CPU** - Real-time CPU usage
- 🔋 **Battery** - Battery status and percentage
- 🧠 **Memory** - Memory and CPU load with colors

### 🪟 Window Management
- **Rounded Catppuccin styling** - Beautiful window tabs
- **Smart window naming** - Shows just the window name (`#W`)
- **Automatic renumbering** - Clean window indexing
- **Mouse support** - Click to switch panes and windows

### ⌨️ Key Bindings
- **Prefix**: `Ctrl+d` (instead of default `Ctrl+b`)
- **Split panes**: `|` (horizontal) and `-` (vertical)
- **Vim-style navigation**: `h`/`j`/`k`/`l` for pane movement
- **Easy resizing**: `H`/`J`/`K`/`L` for pane resizing
- **Quick reload**: `Ctrl+d` then `r`

### 🎨 Theme
- **Catppuccin Mocha** - Dark, elegant color scheme
- **Nerd Font icons** - Beautiful status bar icons
- **Smart colors** - Status changes based on tmux state

## 🚀 Quick Install

### One-Line Setup
```bash
git clone https://github.com/yourusername/tmux-catppuccin-setup.git
cd tmux-catppuccin-setup
./install.sh
```

### Manual Scripts
```bash
# Run individual installation scripts
./scripts/install-nerd-font.sh && ./scripts/install-tpm.sh
```

### Manual Installation

#### 1. Install Prerequisites

**macOS:**
```bash
# Install tmux
brew install tmux

# Install git (if not already installed)
brew install git
```

**Linux (Ubuntu/Debian):**
```bash
# Install tmux and git
sudo apt update
sudo apt install tmux git curl unzip

# For other Linux distributions, use your package manager
```

#### 2. Install JetBrains Mono Nerd Font
```bash
./scripts/install-nerd-font.sh
```

#### 3. Install TPM (Tmux Plugin Manager)
```bash
./scripts/install-tpm.sh
```

#### 4. Apply Configuration
```bash
# Copy the configuration file
cp tmux.conf ~/.tmux.conf

# Start tmux
tmux new-session

# Install plugins: Press Ctrl+d then I (capital i)
# Reload config: Press Ctrl+d then r
```

## 📋 Detailed Setup Instructions

### Step 1: Clone Repository
```bash
git clone https://github.com/yourusername/tmux-catppuccin-setup.git
cd tmux-catppuccin-setup
```

### Step 2: Font Installation
The configuration requires a Nerd Font for proper icon display.

**Automatic Installation:**
```bash
./scripts/install-nerd-font.sh
```

**Manual Installation:**
1. Download [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono)
2. Install the font on your system
3. Configure your terminal to use the font

**Terminal Configuration:**
- **iTerm2**: Preferences → Profiles → Text → Font
- **Terminal.app**: Preferences → Profiles → Text → Font  
- **VS Code**: Settings → Terminal › Integrated: Font Family
- **Alacritty**: Add to `alacritty.yml`:
  ```yaml
  font:
    normal:
      family: "JetBrainsMono Nerd Font"
  ```

### Step 3: TPM Installation
```bash
./scripts/install-tpm.sh
```

This script will:
- Install TPM to `~/.tmux/plugins/tpm`
- Set proper permissions
- Provide next steps

### Step 4: Configuration Setup
```bash
# Backup existing configuration (optional)
cp ~/.tmux.conf ~/.tmux.conf.backup 2>/dev/null || true

# Copy new configuration
cp tmux.conf ~/.tmux.conf
```

### Step 5: Plugin Installation
1. Start tmux: `tmux new-session`
2. Install plugins: `Ctrl+d` then `I` (capital i)
3. Wait for plugins to install
4. Reload configuration: `Ctrl+d` then `r`

## 🎛️ Configuration Details

### Plugins Used
- **TPM** - Plugin manager
- **Catppuccin** - Main theme
- **tmux-battery** - Battery status
- **tmux-cpu** - CPU monitoring  
- **tmux-mem-cpu-load** - Memory/CPU load

### Key Bindings Reference

| Key Combination | Action |
|---|---|
| `Ctrl+d` | Prefix key |
| `Ctrl+d` + `\|` | Split horizontally |
| `Ctrl+d` + `-` | Split vertically |
| `Ctrl+d` + `h/j/k/l` | Navigate panes |
| `Ctrl+d` + `H/J/K/L` | Resize panes |
| `Ctrl+d` + `c` | New window |
| `Ctrl+d` + `r` | Reload config |
| `Ctrl+d` + `I` | Install plugins |
| `Ctrl+d` + `U` | Update plugins |

### Status Bar Modules

The status bar displays (left to right):
1. **Directory** (`#{E:@catppuccin_status_directory}`)
2. **Application** (`#{E:@catppuccin_status_application}`)  
3. **Session** (`#{E:@catppuccin_status_session}`)
4. **CPU** (`#{E:@catppuccin_status_cpu}`)
5. **Battery** (`#{E:@catppuccin_status_battery}`)

## 🎨 Customization

### Changing Colors
Modify theme flavor in `tmux.conf`:
```bash
set -g @catppuccin_flavor 'mocha'    # mocha, macchiato, frappe, latte
```

### Window Style
Change window appearance:
```bash
set -g @catppuccin_window_status_style "rounded"  # rounded, basic, slanted
```

### Adding/Removing Status Modules
Edit the status bar configuration:
```bash
# Add uptime module
set -agF status-right "#{E:@catppuccin_status_uptime}"

# Remove battery module (comment out)
# set -agF status-right "#{E:@catppuccin_status_battery}"
```

### Custom Module Configuration
```bash
# Customize directory module
set -g @catppuccin_directory_icon " "
set -g @catppuccin_directory_color "#{@thm_blue}"
set -g @catppuccin_directory_text " #{pane_current_path}"
```

## 🔧 Troubleshooting

### Icons Not Showing
- Ensure you have a Nerd Font installed
- Verify your terminal is using the Nerd Font
- Try restarting your terminal

### Plugin Installation Fails
```bash
# Remove plugins directory and reinstall
rm -rf ~/.tmux/plugins
./scripts/install-tpm.sh
# Then reinstall plugins: Ctrl+d + I
```

### Configuration Not Loading
```bash
# Check for syntax errors
tmux source-file ~/.tmux.conf

# View tmux messages
tmux show-messages
```

### Battery/CPU Not Showing
These modules may take a moment to initialize. If they don't appear:
1. Ensure plugins are installed: `Ctrl+d` + `I`
2. Update plugins: `Ctrl+d` + `U`
3. Reload config: `Ctrl+d` + `r`

## 📸 Screenshots

### Different Themes
- 🌿 **Mocha** (default) - Dark theme
- 🌺 **Macchiato** - Medium dark  
- 🪴 **Frappé** - Medium light
- 🌻 **Latte** - Light theme

### Window Styles
- **Rounded** - Smooth, modern look
- **Basic** - Clean, simple blocks
- **Slanted** - Angular, dynamic style

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📝 License

This configuration is provided as-is under the MIT License. Feel free to modify and distribute.

## 🙏 Acknowledgments

- [Catppuccin](https://github.com/catppuccin) - Beautiful color scheme
- [TPM](https://github.com/tmux-plugins/tpm) - Plugin manager
- [Nerd Fonts](https://www.nerdfonts.com/) - Icon fonts
- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer

---

**Enjoy your beautiful tmux setup! 🎉**

For questions or issues, please open an issue on GitHub.