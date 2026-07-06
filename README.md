# My Zsh Configuration

This repository contains my custom `.zshrc` configuration file, tailored for a modern, efficient, and visually appealing terminal experience. It integrates modern CLI replacements, advanced autocompletion, and an informative prompt.

## 🔌 Plugins

This configuration relies on several powerful Zsh plugins to enhance productivity:

* **[fzf-tab](https://github.com/Aloxaf/fzf-tab)**: Replaces Zsh's default completion menu with `fzf`. It is configured to preview directories using `eza` and files using `bat` directly in the completion menu.
* **[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)**: Suggests commands as you type based on your command history and completions.
* **[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)**: Highlights commands in the terminal as they are typed, helping to catch syntax errors before execution.
* **[zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete)**: Adds real-time type-ahead autocompletion to the command line.
* **[zsh-dirhistory](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dirhistory)**: Provides keyboard shortcuts for quickly navigating previously visited directories.

## 🛠️ Modern CLI Tools (Aliases)

Standard Unix commands have been aliased to modern alternatives for better formatting and syntax highlighting:

* **[eza](https://github.com/eza-community/eza)**: A modern replacement for `ls`.
    * `ls` mapped to `eza --icons`
    * `ll` mapped to `eza -lah --icons`
    * `la` mapped to `eza -a --icons`
    * `lt` mapped to `eza --tree --level=2 --icons`
* **[bat](https://github.com/sharkdp/bat)**: A modern replacement for `cat` with syntax highlighting and Git integration. 
    * `cat` mapped to `bat`

## 🚀 Prompt

* **[Starship](https://starship.rs/)**: A fast, cross-shell prompt that provides context-aware information (like Git status, package versions, etc.) right at the command line.

## ⚙️ Additional Configurations

* **History**: Configured to save up to 100,000 entries, immediately append new commands, share history across active sessions, and automatically ignore duplicate entries or commands prefixed with a space.
* **Completion Menu**: Set to case-insensitive matching (`m:{a-zA-Z}={A-Za-z}`) with terminal list-colors integration.
