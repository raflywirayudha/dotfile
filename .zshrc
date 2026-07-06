zstyle :compinstall filename '/home/USER/.zshrc'

# Initialize the Zsh completion system
autoload -Uz compinit
compinit

# Load Zsh plugins for enhanced functionality
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh                         # Replaces default completion menu with fzf
source /usr/share/zsh-dirhistory/dirhistory.plugin.zsh           # Enables directory navigation shortcuts (Alt+Left/Right)
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh    # Suggests commands based on history as you type
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # Highlights command syntax in real-time
source $HOME/zsh-autocomplete/zsh-autocomplete.plugin.zsh        # Adds real-time type-ahead autocompletion


# --- Completion System Configuration ---
# Enable interactive menu selection for autocompletion
zstyle ':completion:*' menu select
# Enable case-insensitive matching for completions
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Apply standard LS_COLORS to the completion menu
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# fzf-tab: Preview directories using 'eza' (as a tree) when completing a 'cd' command
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree --level=2 --color=always $realpath'

# fzf-tab: General preview setup during completion
zstyle ':fzf-tab:complete:*' fzf-preview '
# If the target is a directory, preview it as a tree using eza
if [[ -d $realpath ]]; then
    eza --tree --level=2 --color=always $realpath
# If the target is a file, preview its contents using bat
else
    bat --style=numbers --color=always --line-range=:300 $realpath
fi
'

# Load fzf-tab plugin (Note: this is sourced again here based on original config)
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh


# --- Modern CLI Tools (Aliases) ---
# Replace standard 'ls' commands with 'eza' for better formatting and icons
alias ls='eza --icons'                         # Standard list with icons
alias ll='eza -lah --icons'                    # Detailed list, including hidden files
alias la='eza -a --icons'                      # List all files, including hidden
alias lt='eza --tree --level=2 --icons'        # Display files in a tree format (depth 2)

# Replace standard 'cat' with 'bat' for syntax highlighting
alias cat='bat'


# --- History Configuration ---
HISTFILE="$HOME/.zsh_history"                  # Set the file where command history is saved
HISTSIZE=100000                                # Keep 100,000 commands in memory
SAVEHIST=100000                                # Save 100,000 commands to the history file

# History saving behaviors
setopt APPEND_HISTORY                          # Append to the history file instead of overwriting it
setopt INC_APPEND_HISTORY                      # Save commands to history immediately after execution
setopt SHARE_HISTORY                           # Share command history across all active Zsh sessions

# History duplication prevention
setopt HIST_IGNORE_DUPS                        # Ignore a command if it's the exact same as the previous one
setopt HIST_IGNORE_ALL_DUPS                    # Remove older duplicate commands from history
setopt HIST_SAVE_NO_DUPS                       # Do not write duplicate commands to the history file
setopt HIST_FIND_NO_DUPS                       # Do not display duplicate entries when searching history

# Ignore commands starting with a space (useful for passwords or temporary commands)
setopt HIST_IGNORE_SPACE


# Initialize the Starship cross-shell prompt
eval "$(starship init zsh)"
