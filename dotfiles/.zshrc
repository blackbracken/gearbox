#!/bin/zsh

[[ $- == *i* && $ZSH_VERSION ]] && SHELL=/usr/bin/zsh || return 0

autoload -Uz colors; colors
autoload -Uz compinit; compinit

HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=4096
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups

setopt auto_pushd
setopt magic_equal_subst
setopt prompt_subst
setopt no_flow_control
setopt no_beep

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[^[[D" backward-word

alias :q="exit"
alias :Q="exit"
alias untar="tar -zxvf"
alias vim="nvim"
alias ls="exa"
alias lsa="exa -a"
alias tree="exa -T -I \".git\""
alias ghci="stack ghci"

alias gcc.oit="gcc -std=c89 -Wall -Wextra"
alias ssh.oit="ssh e1n18095@o-vnc.center.oit.ac.jp"

# powerline-rs
prompt() {
  PS1="$(powerline-rs --modules ssh,root,cwd,git,gitstage --cwd-max-depth 2 --shell zsh $?)"
}
if type "yay" > /dev/null 2>&1; then precmd_functions+=(prompt); fi

# sdkman
[[ -s "/home/blackbracken/.sdkman/bin/sdkman-init.sh" ]] && source "/home/blackbracken/.sdkman/bin/sdkman-init.sh"
