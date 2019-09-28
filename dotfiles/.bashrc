export GEAR_ROOT="$HOME/.gear"
export SDKMAN_DIR="$HOME/.sdkman"

alias :q="exit"
alias :Q="exit"
alias lsa="ls -A"
alias untar="tar -zxvf"
alias vim=nvim
alias v=nvim
alias ghci="stack ghci"
alias tree="tree -I \".git\""
alias gcc.oit="gcc -std=c89 -Wall -Wextra"
alias ssh.oit="ssh e1n18095@o-vnc.center.oit.ac.jp"

setxkbmap -option ctrl:nocaps

# powerline-rs
prompt() {
  PS1="$(powerline-rs --shell bash $?)"
}
PROMPT_COMMAND=prompt

# sdkman
[[ -s "/home/blackbracken/.sdkman/bin/sdkman-init.sh" ]] && source "/home/blackbracken/.sdkman/bin/sdkman-init.sh"
