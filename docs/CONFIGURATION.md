# 🔧 Configuration Guide

This document provides detailed information about the tmux configuration and how to customize it.

## 📋 Configuration Breakdown

### Basic Settings
```bash
# Change prefix key to Ctrl+c
set -g prefix C-c
bind C-c send-prefix

# Enable mouse support
set -g mouse on

# Set base index for windows and panes to 1
set -g base-index 1
setw -g pane-base-index 1

# Automatically renumber windows when one is closed
set -g renumber-windows on
```

### Key Bindings
```bash
# Better splitting commands
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# Easy pane navigation with vim-like keys
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Easy pane resizing with vim-like keys
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5
```

### Plugin Configuration
```bash
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'catppuccin/tmux'
set -g @plugin 'tmux-plugins/tmux-battery'
set -g @plugin 'tmux-plugins/tmux-cpu'
set -g @plugin 'thewtex/tmux-mem-cpu-load'

# Catppuccin theme configuration
set -g @catppuccin_flavor "mocha"
set -g @catppuccin_window_status_style "rounded"
set -g @catppuccin_window_text "#W"
set -g @catppuccin_window_current_text "#W"
```

### Status Bar Configuration
```bash
# Full status bar with all components
set -g status-right "#{E:@catppuccin_status_directory}"
set -agF status-right "#{E:@catppuccin_status_application}"
set -agF status-right "#{E:@catppuccin_status_session}"
set -agF status-right "#{E:@catppuccin_status_cpu}"
set -agF status-right "#{E:@catppuccin_status_battery}"
```

## 🎨 Theme Customization

### Available Catppuccin Flavors
- **mocha** - Dark theme (default)
- **macchiato** - Medium dark
- **frappe** - Medium light  
- **latte** - Light theme

### Window Styles
- **rounded** - Smooth corners (default)
- **basic** - Simple blocks
- **slanted** - Angular separators
- **custom** - Define your own separators
- **none** - No styling

### Color Variables
Catppuccin provides these color variables:
```bash
#{@thm_bg}          # Background
#{@thm_fg}          # Foreground  
#{@thm_cyan}        # Cyan
#{@thm_black}       # Black
#{@thm_gray}        # Gray
#{@thm_magenta}     # Magenta
#{@thm_pink}        # Pink
#{@thm_red}         # Red
#{@thm_green}       # Green
#{@thm_yellow}      # Yellow
#{@thm_blue}        # Blue
#{@thm_orange}      # Orange
#{@thm_black4}      # Dark gray
```

## 🔧 Module Customization

### Directory Module
```bash
# Change directory icon
set -g @catppuccin_directory_icon " "

# Show full path instead of basename
set -g @catppuccin_directory_text " #{pane_current_path}"

# Change directory color
set -g @catppuccin_directory_color "#{@thm_blue}"
```

### Session Module
```bash
# Change session icon
set -g @catppuccin_session_icon " "

# Custom session text
set -g @catppuccin_session_text " #S"

# Override session color (disable prefix indicator)
set -g @catppuccin_session_color "#{@thm_green}"
```

### Battery Module
```bash
# Change battery icon
set -g @catppuccin_battery_icon " "

# Custom battery text format
set -g @catppuccin_battery_text " #{battery_percentage}"

# Change battery color
set -g @catppuccin_battery_color "#{@thm_yellow}"
```

### CPU Module
```bash
# Change CPU icon
set -g @catppuccin_cpu_icon " "

# Custom CPU text format
set -g @catppuccin_cpu_text " #{cpu_percentage}"

# Change CPU color
set -g @catppuccin_cpu_color "#{@thm_red}"
```

## ⚡ Advanced Customization

### Adding Custom Modules
You can add custom information to the status bar:

```bash
# Add current time
set -ag status-right "#[fg=#89b4fa,bg=#313244] %H:%M #[default]"

# Add hostname
set -ag status-right "#[fg=#a6e3a1,bg=#313244] #H #[default]"

# Add git branch (requires git)
set -ag status-right "#[fg=#f9e2af,bg=#313244] #(cd #{pane_current_path}; git branch 2>/dev/null | grep '^\*' | cut -d' ' -f2-) #[default]"
```

### Custom Key Bindings
```bash
# Add custom key bindings
bind-key r source-file ~/.tmux.conf \; display-message "Config reloaded!"
bind-key | split-window -h -c "#{pane_current_path}"
bind-key - split-window -v -c "#{pane_current_path}"

# Window navigation
bind-key -n M-Left previous-window
bind-key -n M-Right next-window
```

### Pane Styling
```bash
# Pane border colors
set -g pane-border-style "fg=#313244"
set -g pane-active-border-style "fg=#89b4fa"

# Pane border status
set -g pane-border-status bottom
set -g pane-border-format " #{b:pane_current_path} "
```

## 🎯 Status Line Variables

Common tmux variables you can use:
- `#S` - Session name
- `#W` - Window name
- `#I` - Window index
- `#P` - Pane index
- `#T` - Pane title
- `#H` - Hostname
- `#{pane_current_path}` - Current directory path
- `#{b:pane_current_path}` - Current directory basename
- `%H:%M` - Current time (24h format)
- `%d-%b-%y` - Current date

## 🔄 Applying Changes

After modifying the configuration:
1. Reload tmux config: `Ctrl+c` then `r`
2. Or restart tmux: `tmux kill-server && tmux`
3. For plugin changes: `Ctrl+c` then `U` to update plugins

## 📝 Example Customizations

### Minimalist Setup
```bash
# Simple status bar with just session and time
set -g status-right "#{E:@catppuccin_status_session}"
set -ag status-right "#[fg=#89b4fa,bg=#313244] %H:%M #[default]"
```

### Developer Setup
```bash
# Status bar optimized for development
set -g status-right "#{E:@catppuccin_status_directory}"
set -ag status-right "#[fg=#f9e2af,bg=#313244] #(cd #{pane_current_path}; git branch 2>/dev/null | grep '^\*' | cut -d' ' -f2-) #[default]"
set -agF status-right "#{E:@catppuccin_status_session}"
```

### System Monitor Setup
```bash
# Full system monitoring
set -g status-right "#{E:@catppuccin_status_directory}"
set -agF status-right "#{E:@catppuccin_status_uptime}"
set -agF status-right "#{E:@catppuccin_status_cpu}"
set -ag status-right "#($TMUX_PLUGIN_MANAGER_PATH/tmux-mem-cpu-load/tmux-mem-cpu-load --colors --interval 2)"
set -agF status-right "#{E:@catppuccin_status_battery}"
set -agF status-right "#{E:@catppuccin_status_session}"
```