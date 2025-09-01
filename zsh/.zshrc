# zmodload zsh/zprof
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
# function _history_substring_search_config() {
#     bindkey '^[[A' history-substring-search-up
#     bindkey '^[[B' history-substring-search-down
# }
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=blue,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red,bold'
export HISTORY_SUBSTRING_SEARCH_FUZZY='true'
export HISTORY_SUBSTRING_SEARCH_PREFIXED='true'

# zinit ice wait lucid atload'_history_substring_search_config' \
#   ver'dont-overwrite-config'
# zinit light 'ericbn/zsh-history-substring-search'

## Options

# zoxide
eval "$(zoxide init zsh)"

setopt histignorespace

# add tab completion to aliases
setopt completealiases

# # zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 
# # zstyle ':completion:*' matcher-list 'r:|?=**'
# # zstyle ':completion:*' matcher-list '' \
# #   'm:{a-z\-}={A-Z\_}' \
# #   'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
# #   'r:|?=** m:{a-z\-}={A-Z\_}' \
# #   'r:{[:lower:][:upper:]}={[:upper:][:lower:]}'
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path "$HOME/.cache/zsh/.zcompcache"
# # zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*' 'm:{a-z\-}={A-Z\_}'
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' menu select
# # zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' group-name ''
# _comp_options+=(globdots)

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

alias rl="exec zsh"

alias ..="cd .."
alias reboot="systemctl reboot"

alias bruh='sudo $(history -p !!)'

alias rgf='rg --files | rg'

alias gotop="gotop -s --mbps"

setopt histignoredups
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

setopt autocd

WORDCHARS="*?_[]~=&;!#$%^(){}<>"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export PATH="$HOME/.local/bin:$PATH"

if [[ "$OSTYPE" == "darwin"* ]]; then
    source ~/.mac.zsh
fi

# Initialize modules.
zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo'

source ~/.zsh/antidote/share/antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -M menuselect 'l' vi-forward-char

eval "$(zoxide init zsh)"

# Starship prompt
eval "$(starship init zsh)"

# zprof
