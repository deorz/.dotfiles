### ---------- ZSH-Plugins ---------------------------------
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### ---- autocompletions -----------------------------------
fpath=(~/.zsh_completions $fpath)
# Add ZSH brew autocompletions (required before compinit)
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

# Load Completions
autoload -U compinit; compinit

### --------- ZSH-Plugins (Required after compiling completions) ----------
ZSH_PLUGINS_DIR=~/.zsh_plugins

source $ZSH_PLUGINS_DIR/fzf-tab/fzf-tab.plugin.zsh

### ---- Completion options and styling -----------------------------------
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
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

### ------------------- Fzf Settings ------------------------------------
# Setting theme for fzf
FZF_DEFAULT_OPTS="\
  --color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

### ---- History Configuration -----------------------------------
HISTSIZE=1000000               # How many lines of history to keep in memory
HISTFILE=~/.zsh_history     # Where to save history to disk
SAVEHIST=$HISTSIZE             # Number of history entries to save to disk
setopt appendhistory
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space       # Ignores all commands starting with a blank space! Usefull for passwords

### ---- Aliases Configuration -----------------------------------
alias ls="lsd"
alias zi="cdi"
alias htop="btm"
alias find="fd"
alias grep="rg"

### ---- load Pyenv and libpq(psql) ---------
export PATH="$(brew --prefix)/opt/libpq/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

### ------- Load NodeVersionManager (NVM) -----------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"

# ### ---- Neovim Configuration Switcher --------------------------
# function nvims() {
#   items=("DeorzNvim" "LazyNvim" "NvChad" "AstroNvim")
#   config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
#   if [[ -z $config ]]; then
#     echo "Nothing selected"
#     return 0
#   elif [[ $config == "default" ]]; then
#     config=""
#   fi
#   NVIM_APPNAME=$config nvim $@
# }

### ---- Add Poetry & libpq(psql) to PATH ----------------------
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

### ---- Load Utilities  -----------------------------------
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"
eval "$(starship init zsh)"

neofetch
