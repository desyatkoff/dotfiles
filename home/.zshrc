if [[ $(tty) =~ /dev/tty[0-9]+ ]]; then
    exec bash
fi

export EDITOR="helix"
export FZF_DEFAULT_OPTS=" \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
    --color=selected-bg:#45475a \
    --color=border:#6c7086,label:#cdd6f4 \
"
export GPG_TTY=$(tty)
export LANG="en_US.UTF-8"
export PATH="$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.cargo/bin"
export SHELL="/usr/bin/zsh"
export TERM="kitty"
export ZSH="$HOME/.oh-my-zsh"

alias cal="cal --monday --iso --year"
alias cp="cp -i"
alias del="gio trash"
alias ff="fastfetch"
alias hx="helix"
alias lsd="lsd --all --blocks 'permission,size,name' --group-directories-first"
alias mv="mv -i"
alias peaclock="peaclock --config-dir ~/.config/peaclock/"
alias please="sudo"
alias pls="sudo"
alias rm="rm -ri"
alias tree="tree -a -N --dirsfirst --sort name"
alias weather="curl 'https://wttr.in'"
alias weather3="curl 'https://wttr.in?format=3'"
alias wttr="curl 'https://wttr.in'"
alias wttr3="curl 'https://wttr.in?format=3'"

ZSH_THEME_RANDOM_CANDIDATES=()
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
HISTFILE=~/.zsh_history
HISTSIZE=2147483647
SAVEHIST=2147483647
plugins=(
    git
    fzf-tab
    fast-syntax-highlighting
)

setopt autocd
setopt extended_glob
setopt hist_ignore_dups
setopt share_history
setopt prompt_subst
setopt beep
setopt nomatch

bindkey -e

zstyle ':compinstall' filename '~/.zshrc'
zstyle ':omz:update' mode reminder
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' switch-group '<' '>'

autoload -Uz compinit && compinit
autoload -Uz colors && colors

source $ZSH/oh-my-zsh.sh

git_info() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    local modified=$(git status --porcelain 2>/dev/null | grep -E '^[ MDAURC ]' | wc -l | tr -d ' ')
    local untracked=$(git status --porcelain 2>/dev/null | grep '^\\\?\\\?' | wc -l | tr -d ' ')

    untracked=$((untracked - modified))

    if [[ -z "$branch" ]]; then
        return
    fi

    echo -n " on %F{green}$branch%f"

    if [[ "$modified" -gt 0 ]]; then
        echo -n " %F{yellow}!$modified%f"
    fi

    if [[ "$untracked" -gt 0 ]]; then
        echo -n " %F{yellow}?$untracked%f"
    fi
}

PROMPT='%F{blue}%~%f$(git_info) %F{green}>%f '
