### Plugin Manager
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust


### End of Zinit's installer chunk

# env variables
EDITOR='nvim'
VISUAL='nvim'
PAGER='less'
BROWSER='firefox'
TERMINAL='kitty'

# ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
# ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE
# ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
# ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK

# histfile config
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=10000
setopt SHARE_HISTORY
alias history="history 0"

alias v="$EDITOR"
alias vi="$EDITOR"
alias cat=bat

alias lss="du -h --max-depth=1 ."

### Plugins
function _history_substring_search_config() {
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
}
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=blue,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red,bold'
export HISTORY_SUBSTRING_SEARCH_FUZZY='true'
export HISTORY_SUBSTRING_SEARCH_PREFIXED='true'

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk


zinit ice wait lucid atload'_history_substring_search_config' \
  ver'dont-overwrite-config'
zinit load 'ericbn/zsh-history-substring-search'

 

zinit ice wait"1" lucid
zinit load "MichaelAquilina/zsh-you-should-use"

zinit ice wait lucid
zinit light "pkulev/zsh-rustup-completion"

zinit light "coot/zsh-haskell"

zinit light "greymd/docker-zsh-completion"

zinit ice lucid nocompile
zinit load MenkeTechnologies/zsh-cargo-completion

zinit ice wait lucid
zinit light "zpm-zsh/ssh"

# zinit light zsh-users/zsh-autosuggestions
# ZSH_AUTOSUGGEST_STRATEGY=history

zinit ice wait"2" lucid
zinit light Tarrasch/zsh-bd

zinit ice wait lucid
zinit light peterhurford/up.zsh

# zinit light "hcgraf/zsh-sudo"

zinit ice wait lucid
zinit light "zsh-users/zsh-completions"

# zinit light "marlonrichert/zsh-autocomplete"

## Options

# zoxide
# unalias zi
eval "$(zoxide init zsh)"

setopt histignorespace

autoload -U compinit; compinit
zmodload -i zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
# zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 
# zstyle ':completion:*' matcher-list 'r:|?=**'
# zstyle ':completion:*' matcher-list '' \
#   'm:{a-z\-}={A-Z\_}' \
#   'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
#   'r:|?=** m:{a-z\-}={A-Z\_}' \
#   'r:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/.zcompcache"
# zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*' 'm:{a-z\-}={A-Z\_}'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' group-name ''
_comp_options+=(globdots)

# 
# history search


# Aliases

# ls
#alias l="exa -alh --icons --color=automatic"
#alias ls="exa --icons --color=automatic"
alias l="lsd -alth --color=auto"
alias ls="lsd --color=auto"
alias lf="lsd -alSh --color=auto"

# editors
alias vsc="code ."
alias nv="nvim ."

#git
alias gcm="git commit -m"
alias ga="git add -A"
alias gp="git push"
alias gr='cd "$(git rev-parse --show-toplevel)"'
alias gsb='git status -sb --show-stash --untracked-files=normal'

#zinit
alias zup="zinit update --parallel"

alias rl="exec zsh"

alias ..="cd .."
alias reboot="systemctl reboot"

alias dot="cd ~/Pkgs/dotfiles"
alias czsh="nvim ~/Pkgs/dotfiles/zsh/.zshrc"
alias cvi="nvim ~/.config/nvim/init.vim"


# alias bruh='sudo $(history -p !!)'
# alias please='doas $(history -p !!)'

alias rgf='rg --files | rg'

alias gotop="gotop -s --mbps"

setopt histignoredups
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

setopt autocd
setopt completealiases


WORDCHARS="*?_[]~=&;!#$%^(){}<>"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
alias gg="$GOPATH/bin/g"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
export GOPATH="$HOME/go"; export GOROOT="$HOME/.go"; export PATH="$GOPATH/bin:$PATH"; # g-install: do NOT edit, see https://github.com/stefanmaric/g
export SPICETIFY_INSTALL="/home/atarbinian/.spicetify/"
export PATH="$SPICETIFY_INSTALL:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="$HOME/.local/bin/scripts/:$PATH"
export PATH="$HOME/.cargo/bin/:$PATH"
# export PATH="/var/lib/snapd/snap/bin:$PATH"


export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export XDG_CONFIG_HOME="$HOME/.config"


# export PATH="$HOME/.nodenv/bin:$PATH"
# eval "$(nodenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"


# export THEOS=~/theos
# export THEOS_DEVICE_IP=192.168.1.22
# export THEOS_DEVICE_IP=100.114.237.196

# export JDK_HOME=/usr/bin/javac

#source /home/atarbinian/.config/broot/launcher/bash/br

# zinit ice wait lucid
# zinit load "zsh-users/zsh-syntax-highlighting"
# typeset -A ZSH_HIGHLIGHT_STYLES
# ZSH_HIGHLIGHT_STYLES[command]='fg=#a9a9a9'
# # ZSH_HIGHLIGHT_STYLES[alias]='fg=#a9a9a9'
# ZSH_HIGHLIGHT_STYLES[builtin]='fg=#a9a9a9'
# ZSH_HIGHLIGHT_STYLES[path]='fg=magenta'

# export QSYS_ROOTDIR="/home/atarbinian/.cache/paru/clone/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/21.1/quartus/sopc_builder/bin"

# export PATH="$GHCUP_INSTALL_BASE_PREFIX/.ghcup/bin/:$PATH"


#lfs
# date +"%c"
#

alias shell='f() { nix-shell ~/.nixos/shells/$1.nix --command zsh }; f'

# Starship prompt
eval "$(starship init zsh)"

