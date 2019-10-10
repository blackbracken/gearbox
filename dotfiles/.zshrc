#!/bin/zsh

export PATH="$PATH:$HOME/.cargo/bin"

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

alias gcc.oit="gcc -std=c89 -Wall -Wextra"
alias ssh.oit="ssh e1n18095@o-vnc.center.oit.ac.jp"

# etc
alias gear="cd ~/.gearbox"
alias vim="nvim"
alias ghci="stack ghci"

# ntpdate
if type "ntpdate" > /dev/null 2>&1; then
  alias akashi="sudo ntpdate -b ntp.nict.jp && sudo timedatectl set-ntp true"
fi

# lsd
if type "lsd" > /dev/null 2>&1; then
  alias ls="lsd --long --blocks permission,size,name"
  alias lsa="lsd --long --almost-all"
  alias tree="lsd --tree"
fi

# powerline-rs
prompt() {
  PS1="$(powerline-rs --modules ssh,root,cwd,git,gitstage --cwd-max-depth 2 --shell zsh $?)"
}
if type "powerline-rs" > /dev/null 2>&1; then precmd_functions+=(prompt); fi

# sdkman
[[ -s "/home/blackbracken/.sdkman/bin/sdkman-init.sh" ]] && source "/home/blackbracken/.sdkman/bin/sdkman-init.sh"
