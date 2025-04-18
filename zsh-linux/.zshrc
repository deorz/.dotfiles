### ----------------------------------------- Pywal integration -------------------------------------------------------
if [ -f ~/.cache/wal/sequences ]; then
    (cat ~/.cache/wal/sequences &)
fi

if [ -f ~/.cache/wal/colors.sh ]; then
    source ~/.cache/wal/colors.sh
fi
### ----------------------------------------- ZSH-Plugins -------------------------------------------------------------
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh


### ----------------------------------------- Autocompletions ---------------------------------------------------------
fpath=(~/.zsh_completions $fpath)

# Load Completions
autoload -U compinit; compinit

### ----------------------------------------- ZSH-Plugins (Required after compiling completions) ----------------------
ZSH_PLUGINS_DIR=~/.zsh_plugins

source $ZSH_PLUGINS_DIR/fzf-tab/fzf-tab.plugin.zsh

### ----------------------------------------- Completion Options and Styling ------------------------------------------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':completion:*' special-dirs true # Complete . and .. special directories
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01' # colorize kill list
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# set fzf-tab inherit FZF_DEFAULT_OPTS
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

### ----------------------------------------- FZF Settings ------------------------------------------------------------
if [ ! -f ~/.cache/wal/colors.sh ]; then
    # Setting theme for FZF
    export FZF_DEFAULT_OPTS=" \
    --color=spinner:#f2d5cf,hl:#e78284 \
    --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
    --color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
    --color=selected-bg:#51576d \
    --color=border:#414559,label:#c6d0f5"
fi
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

### ----------------------------------------- History Configuration ---------------------------------------------------
HISTSIZE=1000000                # How many lines of history to keep in memory
HISTFILE=~/.zsh_history         # Where to save history to disk
SAVEHIST=$HISTSIZE              # Number of history entries to save to disk
setopt appendhistory
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space        # Ignores all commands starting with a blank space! Useful for passwords

### ----------------------------------------- Aliases Configuration ---------------------------------------------------
alias ls="eza --icons"
alias zi="cdi"
alias htop="btop"
alias find="fd"
alias grep="rg"

### ----------------------------------------- Load Pyenv, Cargo, Poetry -----------------------------------------------
export PATH="$HOME/.local/bin:$PATH"
source "$HOME/.cargo/env"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

### ----------------------------------------- Load NodeVersionManager (NVM) -------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

### ----------------------------------------- Load Utilities ----------------------------------------------------------
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"
eval "$(starship init zsh)"

eval "$(fzf --zsh)"
eval "$(starship init zsh)"

export EDITOR=nvim

### ----------------------------------------- TMUX configuration ------------------------------------------------------
if [ "$TERM_PROGRAM" = tmux ]; then
    bindkey -e
fi

### ----------------------------------------- Shell commands (fetchers, etc.) -----------------------------------------
fastfetch --config examples/13
