# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Load completion system
autoload -U compinit; compinit

# Zsh Completion Settings
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:git-checkout:*' sort false

# fzf-tab plugin configuration
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# Theme and plugin setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="flaxo"
plugins=(
  git
  fzf-tab
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh
# FZF configuration
#export FZF_DEFAULT_OPTS="--style full --border --padding 1,2 --border-label ' Demo ' --input-label ' Input ' --header-label ' File Type ' --preview '[[ -d {} ]] && ls -lh --color=always {} || fzf-preview.sh {} | cut -c1-$(tput cols)' --bind 'result:transform-list-label: if [[ -z \$FZF_QUERY ]]; then echo \" \$FZF_MATCH_COUNT items \"; else echo \" \$FZF_MATCH_COUNT matches for [\$FZF_QUERY] \"; fi' --bind 'focus:transform-preview-label:[[ -n {} ]] && printf \" Previewing [%s] \" {}' --bind 'focus:+transform-header:file --brief {} || echo \"No file selected\"' --bind 'ctrl-r:change-list-label( Reloading the list )+reload(sleep 2; git ls-files)' --color 'border:#aaaaaa,label:#cccccc' --color 'preview-border:#9999cc,preview-label:#ccccff' --color 'list-border:#669966,list-label:#99cc99' --color 'input-border:#996666,input-label:#ffcccc' --color 'header-border:#6699cc,header-label:#99ccff'"
export TERM=xterm-256color
# PATH
export PATH="$PATH:/home/flaxo/.local/bin"

export GTK_THEME=Adwaita-dark


# Aliases
alias ls='exa --icons'
alias cat='bat --paging=never'
alias fed='vmrun start /backup/fed/fed.vmx'
alias rhtb='exegol start arch' 

# Source FZF integration if available
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Function to use fzf with zoxide
fzf_z() {
    local dir
    dir=$(zoxide query -l | fzf) && cd "$dir" && ls --color=auto
}

# Keybindings
bindkey -s '^g' 'fzf_z\n'
bindkey -s '^s' 'fzf\n'
bindkey '^I' fzf-tab-complete

# zoxide integration
eval "$(zoxide init zsh)"
autoload -U add-zsh-hook
zoxide_add() {
  [[ -d "$PWD" ]] && zoxide add "$PWD"
}
add-zsh-hook chpwd zoxide_add

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
fastfetch
export EXEGOL_HOME=/exegol/exegol-data


alias theme= '~/.config/hypr/scripts/controller.sh $1 > /dev/null'



