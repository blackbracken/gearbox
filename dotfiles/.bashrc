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

# powerline-go
function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -modules user,ssh,cwd,git,exit -cwd-mode dironly -error $?)"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# sdkman
[[ -s "/home/blackbracken/.sdkman/bin/sdkman-init.sh" ]] && source "/home/blackbracken/.sdkman/bin/sdkman-init.sh"
