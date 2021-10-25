# Add bin to path
path+=("$HOME/dev/dotfiles/bin")
path+=("$HOME/.local/bin")
path+=("$HOME/.cargo/bin")
export PATH

# Aliases
source "$HOME/aliases.zsh"
source "$HOME/local_aliases.zsh"

# Enable vi mode
bindkey -v

# No globbing when calling pip
alias pip='noglob pip'

# Show venv in prompt
show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
eval "$(direnv hook zsh)"

# Show git branch in prompt
# TODO: More information here, e.g. when merging, cherrypicking
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{999}on %F{041}%B%b '

setopt PROMPT_SUBST ; PS1='%F{123}$(show_virtual_env) %F{171}%B%~%b ${vcs_info_msg_0_}%F{123}> %f%b'

# zoxide
eval "$(zoxide init zsh)"

# Oh my zsh
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(zsh-syntax-highlighting)
