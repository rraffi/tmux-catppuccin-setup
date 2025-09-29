# 🔧 Troubleshooting Guide

Common issues and their solutions for the tmux Catppuccin setup.

## 🚨 Common Issues

### 1. Icons Not Displaying

**Problem**: Status bar shows boxes or missing characters instead of icons.

**Solutions**:
```bash
# Check if Nerd Font is installed
fc-list | grep -i jetbrains

# Reinstall font
./scripts/install-nerd-font.sh

# Verify terminal font settings
# - iTerm2: Preferences → Profiles → Text → Font
# - Terminal.app: Preferences → Profiles → Text → Font
```

**Font Names to Try**:
- `JetBrainsMono Nerd Font`
- `JetBrains Mono NL`
- `JetBrainsMono NF`

### 2. TPM Installation Error

**Problem**: `'~/.tmux/plugins/tpm/tpm' returned 1`

**Solutions**:
```bash
# Remove and reinstall TPM
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Make sure it's executable
chmod +x ~/.tmux/plugins/tpm/tpm

# Restart tmux completely
tmux kill-server
tmux new-session
```

### 3. Plugins Not Installing

**Problem**: Pressing `Ctrl+c` + `I` doesn't install plugins.

**Solutions**:
```bash
# Check TPM key bindings
tmux list-keys | grep tpm

# Manual plugin installation
~/.tmux/plugins/tpm/bin/install_plugins

# Reset plugins directory
rm -rf ~/.tmux/plugins/*
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Then: Ctrl+c + I
```

### 4. Status Bar Not Showing

**Problem**: Status bar is empty or not configured correctly.

**Solutions**:
```bash
# Check status bar settings
tmux show-options -g | grep status

# Reset status bar
tmux set -g status on
tmux set -g status-position bottom

# Reload configuration
tmux source-file ~/.tmux.conf
```

### 5. Battery Module Not Working

**Problem**: Battery percentage not showing.

**Solutions**:
```bash
# Check if tmux-battery is installed
ls ~/.tmux/plugins/tmux-battery/

# Reinstall battery plugin
rm -rf ~/.tmux/plugins/tmux-battery
# Then: Ctrl+c + I

# For Linux, ensure battery info is available
ls /sys/class/power_supply/
```

### 6. CPU Module Not Working

**Problem**: CPU usage not displaying.

**Solutions**:
```bash
# Check if tmux-cpu is installed
ls ~/.tmux/plugins/tmux-cpu/

# Verify system commands
which vmstat  # Linux
which top     # macOS/Linux

# For macOS, install missing tools
brew install coreutils
```

### 7. Memory Module Issues

**Problem**: Memory module not compiling or showing.

**Solutions**:
```bash
# Install build dependencies
# macOS:
brew install cmake

# Linux (Ubuntu/Debian):
sudo apt install cmake build-essential

# Rebuild memory module
cd ~/.tmux/plugins/tmux-mem-cpu-load
make clean && cmake . && make

# Check if binary exists
ls -la tmux-mem-cpu-load
```

### 8. Configuration Not Loading

**Problem**: Changes to `.tmux.conf` don't take effect.

**Solutions**:
```bash
# Check for syntax errors
tmux source-file ~/.tmux.conf

# View tmux messages
tmux show-messages

# Backup and reset
cp ~/.tmux.conf ~/.tmux.conf.backup
cp tmux.conf ~/.tmux.conf
tmux kill-server && tmux
```

### 9. Colors Look Wrong

**Problem**: Theme colors are incorrect or washed out.

**Solutions**:
```bash
# Check terminal color support
echo $TERM

# Set proper terminal in tmux.conf
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",*256col*:Tc"

# For some terminals:
set -g default-terminal "screen-256color"
```

### 10. Key Bindings Not Working

**Problem**: Custom key bindings don't respond.

**Solutions**:
```bash
# List all key bindings
tmux list-keys

# Check for conflicts
tmux list-keys | grep "C-c"

# Reset and reload
tmux unbind-key -a
tmux source-file ~/.tmux.conf
```

## 🔍 Diagnostic Commands

### Check tmux Information
```bash
# Version
tmux -V

# Current options
tmux show-options -g

# Plugin status
ls ~/.tmux/plugins/

# Key bindings
tmux list-keys | head -20
```

### Check Font Information
```bash
# List installed fonts (Linux)
fc-list | grep -i nerd

# Font cache status (Linux)
fc-cache -v

# Check terminal font (macOS)
defaults read com.apple.Terminal "Default Window Settings"
```

### Check Plugin Status
```bash
# Plugin directories
ls -la ~/.tmux/plugins/

# Plugin executables
find ~/.tmux/plugins/ -name "*.tmux" -executable

# Plugin logs (if any)
cat ~/.tmux/plugins/*/install.log 2>/dev/null || echo "No logs found"
```

## 🛠️ Advanced Debugging

### Enable tmux Logging
```bash
# Add to tmux.conf for debugging
set -g @logging-path "$HOME/.tmux/logs"
set -g @save-complete-history on

# Create logs directory
mkdir -p ~/.tmux/logs
```

### Test Individual Plugins
```bash
# Test battery plugin
~/.tmux/plugins/tmux-battery/scripts/battery_percentage.sh

# Test CPU plugin  
~/.tmux/plugins/tmux-cpu/scripts/cpu_percentage.sh

# Test memory plugin
~/.tmux/plugins/tmux-mem-cpu-load/tmux-mem-cpu-load --interval 1
```

### Reset Everything
If all else fails, complete reset:
```bash
# Backup
cp ~/.tmux.conf ~/.tmux.conf.backup 2>/dev/null

# Clean slate
rm -rf ~/.tmux/
mkdir -p ~/.tmux/plugins

# Reinstall
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp tmux.conf ~/.tmux.conf

# Start fresh
tmux kill-server
tmux new-session
# Then: Ctrl+c + I
```

## 📞 Getting Help

1. **Check tmux messages**: `tmux show-messages`
2. **View plugin logs**: Look in `~/.tmux/plugins/*/`
3. **Test commands individually**: Run plugin scripts manually
4. **Check terminal compatibility**: Ensure proper font and color support
5. **Restart clean**: `tmux kill-server && tmux`

## 📝 Reporting Issues

When reporting issues, include:
- OS and version
- tmux version (`tmux -V`)
- Terminal application and version
- Error messages from `tmux show-messages`
- Output from relevant diagnostic commands

## 🔄 Updates and Maintenance

### Update Plugins
```bash
# Update all plugins
Ctrl+c + U

# Manual update
cd ~/.tmux/plugins/tpm && git pull
```

### Update Configuration
```bash
# Get latest config
git pull origin main
cp tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf
```