if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PS2="%F{green}❯❯ %"
TERM="xterm-256color"
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# PLUGINS
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-auto-notify/auto-notify.plugin.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# COMPLETION
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# EDIT COMMAND LINE
zstyle :zle:edit-command-line editor nvim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# NAVIGATION
bindkey '^H' backward-kill-word
bindkey '5~' kill-word
bindkey ';5D' backward-word
bindkey '^[[1;5D' backward-word
bindkey ';5C' forward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5A' beginning-of-line
bindkey '^[[1;5B' end-of-line

# HISTORY SEARCH
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# ALIASES
alias ls="${aliases[ls]:-ls} -lhA --color=auto"
alias :q="exit"

# OPTS
setopt GLOB_DOTS
setopt APPEND_HISTORY 
setopt INC_APPEND_HISTORY 
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY

path=(~/.local/bin ~/scripts /usr/mvn/apache-maven-3.9.6/bin ~/bin /opt/nvim-linux64/bin $path)
terminal=(~/.local/bin/kitty)

export PATH

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(cat ~/.cache/wal/sequences &)
fastfetch
