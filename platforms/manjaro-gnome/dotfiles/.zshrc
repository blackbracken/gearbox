#!/bin/zsh

export PATH="$PATH:$HOME/.cargo/bin"
export GPG_TTY=$(tty)

[[ $- == *i* && $ZSH_VERSION ]] && SHELL=/usr/bin/zsh || return 0

autoload -Uz colors; colors
autoload -Uz compinit; compinit

HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt print_exit_value
setopt auto_cd
setopt auto_pushd
setopt magic_equal_subst
setopt prompt_subst
setopt no_flow_control
setopt no_beep

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[^[[D" backward-word

source $HOME/.zshalias

# lsd
if type 'lsd' > /dev/null 2>&1; then  
  cdls() {
    \cd "$@" && lsd
  }

  alias cd='cdls'
  alias ls='lsd --long --blocks permission,size,name'
  alias lsa='lsd --long --almost-all'
  alias tree='lsd --tree'
fi

# powerline-rs
prompt() {
  PS1="$(powerline-rs --modules ssh,root,cwd,git,gitstage --cwd-max-depth 2 --shell zsh $?)"
}
if type "powerline-rs" > /dev/null 2>&1; then precmd_functions+=(prompt); fi

# sdkman
if [ -s "/home/blackbracken/.sdkman/bin/sdkman-init.sh" ]; then
  source "/home/blackbracken/.sdkman/bin/sdkman-init.sh"
fi
