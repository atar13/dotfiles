
### Plugin Manager
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# env variables
EDITOR='nvim'
VISUAL='nvim'

# histfile config
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=10000
setopt SHARE_HISTORY

### Plugins
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#586e75'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=#d33682,fg=#002b36,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=#dc322f,fg=#002b36,bold'
function _history_substring_search_config() {
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
}

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

zinit ice wait lucid
zinit load "zsh-users/zsh-syntax-highlighting"
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=cyan'

zinit ice wait lucid atload'_history_substring_search_config' \
  ver'dont-overwrite-config'
zinit load 'ericbn/zsh-history-substring-search'

 

zinit ice wait"1" lucid
zinit load "MichaelAquilina/zsh-you-should-use"

# zinit ice atload"zpcdreplay" atclone'./zplug.zsh'
# zinit light g-plane/zsh-yarn-autocompletions

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

# zinit light "hcgraf/zsh-sudo"

## Options

setopt histignorespace

autoload -U compinit && compinit
zmodload -i zsh/complist
zstyle ':completion:*' menu select

# history search


# Aliases

# ls
alias l="ls -alth --color=auto"
alias lf="ls -alSh --color=auto"

# editors
alias vsc="code ."
alias nv="nvim ."

#git
alias gcm="git commit -m"
alias ga="git add -a"
alias gp="git push"

#zinit
alias zup="zinit update --parallel"

alias ..="cd .."
alias reboot="systemctl reboot"

alias dot="cd ~/pkgs/dotfiles"
alias czsh="nvim ~/.zshrc"


setopt histignoredups
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# Starship prompt
eval "$(starship init zsh)"
