[[ $- != *i* ]] && return

export EDITOR="helix"
export FZF_DEFAULT_OPTS=" \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
    --color=selected-bg:#45475a \
    --color=border:#6c7086,label:#cdd6f4 \
"
export GPG_TTY="$(tty)"
export LANG="en_US.UTF-8"
export PATH="$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.cargo/bin"
export SHELL="/usr/bin/zsh"
export TERM="kitty"
export ZSH="$HOME/.oh-my-zsh"

alias ff="fastfetch"
alias hx="helix"
alias lsx="lsx --all --group-directories-first --show-all-columns --colors --icons --table"

plugins=(
    archlinux
    fast-syntax-highlighting
    fzf-tab
    git
    zoxide
)

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1
zstyle ':omz:update' verbose default
zstyle ':compinstall' filename '~/.zshrc'
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsx --all --group-directories-first --colors --icons $realpath'
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' switch-group '<' '>'

COMPLETION_WAITING_DOTS="true"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="false"
DISABLE_AUTO_TITLE="true"
ZSH_THEME_TERM_TITLE_IDLE="%n@%m:%~"
ZSH_THEME_TERM_TAB_TITLE_IDLE="%~"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_LS_COLORS="false"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="false"
HIST_STAMPS="yyyy-mm-dd"

setopt autocd
setopt extended_glob
setopt hist_ignore_dups
setopt share_history
setopt prompt_subst
setopt beep
setopt nomatch

bindkey -e

autoload -Uz compinit && compinit
autoload -Uz colors && colors

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"

spf() {
    export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"

    command spf "$@"

    [ ! -f "$SPF_LAST_DIR" ] || {
        . "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" > /dev/null
    }
}

branch_prompt_info() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

    if [[ -z "$branch" ]]; then
        return
    fi

    echo -n " ($branch)"
}

PROMPT='%F{blue}$USER%f@$HOST %F{blue}%~%f$(branch_prompt_info)> '
