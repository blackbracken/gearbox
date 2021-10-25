if status is-interactive
  function attach_tmux_session_if_needed
    set ID (tmux list-sessions)
    if test -z "$ID"
        tmux new-session
        return
    end

    set new_session "Create New Session" 
    set ID (echo $ID\n$new_session | peco --on-cancel=error | cut -d: -f1)
    if test "$ID" = "$new_session"
        tmux new-session
    else if test -n "$ID"
        tmux attach-session -t "$ID"
    end
  end

  alias ":q"="exit"
  alias ":Q"="exit"
  alias ":wq"="exit"

  alias "vim"="nvim"

  alias "cat"="bat"
  alias "ls"="exa -l"
  alias "lsa"="exa -la"

  if test -z $TMUX && status --is-login
    attach_tmux_session_if_needed
  end
end
