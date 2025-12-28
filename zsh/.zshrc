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
# save all the history
HISTSIZE=100000
SAVEHIST=100000
# Each shell can access the most recent history
setopt SHARE_HISTORY
# Also remember command start time and duration
setopt EXTENDED_HISTORY
# Correct spelling of all arguments in the command line
setopt CORRECT_ALL

setopt histignoredups
setopt histignorespace

alias history="history 0"

# autoload -U history-search-end
#
# # Cycle through history based on characters already typed on the line
# autoload -U up-line-or-beginning-search
# autoload -U down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bindkey "$key[Up]" history-substring-search-up 
# bindkey "$key[Down]" history-substring-search-down 
#
# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=green'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red,bold'
export HISTORY_SUBSTRING_SEARCH_FUZZY='true'
export HISTORY_SUBSTRING_SEARCH_PREFIXED='true'

ZSH_HIGHLIGHT_HIGHLIGHTERS+=(regexp)
ZSH_HIGHLIGHT_REGEXP+=('^\s*(\.){2,}$' fg=green)

alias v="$EDITOR"
alias vi="$EDITOR"
alias cat=bat

alias lss="du -h --max-depth=1 ."
alias measure="time zsh --interactive -c exit"

# add tab completion to aliases
setopt completealiases

# zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 
# zstyle ':completion:*' matcher-list 'r:|?=**'
# zstyle ':completion:*' matcher-list '' \
#   'm:{a-z\-}={A-Z\_}' \
#   'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
#   'r:|?=** m:{a-z\-}={A-Z\_}' \
#   'r:{[:lower:][:upper:]}={[:upper:][:lower:]}'
# zstyle ':completion:*' use-cache on
# zstyle ':completion:*' cache-path "$HOME/.cache/zsh/.zcompcache"
# # zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*' 'm:{a-z\-}={A-Z\_}'
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' group-name ''
# _comp_options+=(globdots)
#
# # Enable autocompletion
# zstyle ':completion:*' completer _complete _correct _approximate


# Aliases

# ls
alias l="lsd -alth --color=auto"
alias ls="lsd --color=auto"
alias lf="lsd -alSh --color=auto"

# editors
alias vsc="code ."
alias nv="nvim ."

#git
alias gcm="git commit -m"
alias gr='cd "$(git rev-parse --show-toplevel)"'
alias gsb='git status -sb --show-stash --untracked-files=normal'

alias rl="exec zsh"

alias cd="z"
alias ..="cd .."


alias bruh='sudo $(history -p !!)'

alias rgf='rg --files | rg'

alias gotop="gotop -s --mbps"

setopt autocd

WORDCHARS="*?_[]~=&;!#$%^(){}<>"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Set threshold to 20seconds
export AUTO_NOTIFY_THRESHOLD=20

export PATH="$HOME/.local/bin:$PATH"

if [[ "$OSTYPE" == "darwin"* ]]; then
    source ~/.mac.zsh
elif [[ -f /etc/nixos ]]; then
    alias reboot="systemctl reboot"
    if [ -n "$SSH_CLIENT" ]; then
        ssh_details=($SSH_CONNECTION)
        HOST_IP=${ssh_details[0]}
        HOST_PORT=${ssh_details[1]}
        SERVER_IP=${ssh_details[2]}
        SERVER_PORT=${ssh_details[3]}
        MSG="Successful login from ${HOST_IP}:${HOST_PORT} to ${SERVER_IP}:${SERVER_PORT}"
        curl -d ${MSG} https://ntfy.atarbinian.com/ssh
    fi
fi



# Clone zcomet if necessary
ZCOMETDIR=${ZDOTDIR:-${HOME}}/.zcomet
if [[ ! -f ${ZCOMETDIR}/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${ZCOMETDIR}/bin/zcomet.zsh

zcomet load jeffreytse/zsh-vi-mode
zcomet load MichaelAquilina/zsh-you-should-use
zcomet load zpm-zsh/ssh
# zcomet load Tarrasch/zsh-bd
zcomet load peterhurford/up.zsh
zcomet load toku-sa-n/zsh-dot-up
zcomet load zsh-users/zsh-history-substring-search
zcomet load marlonrichert/zsh-autocomplete
if [[ (( $+commands[notify-send] )) ]]; then
  zcomet load MichaelAquilina/zsh-auto-notify
fi

zcomet load zsh-users/zsh-autosuggestions
zcomet load zsh-users/zsh-syntax-highlighting

zcomet compinit

# see man zshcompsys
zstyle ':completion:*:*:cp:*' file-sort size
zstyle ':completion:*' file-sort modification

# limit number of autocomplete options
zstyle -e ':autocomplete:*:*' list-lines 'reply=( $(( LINES / 3 )) )'
# binds for autocommplete plugin (Tab and Shift Tab to cycle through options)
bindkey              '^I' menu-select
bindkey "$terminfo[kcbt]" menu-select

bindkey -M emacs \
    "^[p"   .history-search-backward \
    "^[n"   .history-search-forward \
    "^P"    .up-line-or-history \
    "^[OA"  .up-line-or-history \
    "^[[A"  .up-line-or-history \
    "^N"    .down-line-or-history \
    "^[OB"  .down-line-or-history \
    "^[[B"  .down-line-or-history \
    "^R"    .history-incremental-search-backward \
    "^S"    .history-incremental-search-forward \
    #
bindkey -a \
    "^P"    .up-history \
    "^N"    .down-history \
    "k"     .up-line-or-history \
    "^[OA"  .up-line-or-history \
    "^[[A"  .up-line-or-history \
    "j"     .down-line-or-history \
    "^[OB"  .down-line-or-history \
    "^[[B"  .down-line-or-history \
    "/"     .vi-history-search-backward \
    "?"     .vi-history-search-forward \
    #

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

eval "$(zoxide init zsh)"

# prompt
eval "$(starship init zsh)"



# zprof
