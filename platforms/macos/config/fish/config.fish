if status is-interactive
  eval (/opt/homebrew/bin/brew shellenv)

  alias ":q"="exit"
  alias ":Q"="exit"
  alias ":wq"="exit"

  alias "vim"="nvim"

  alias "cat"="bat"
  alias "ls"="exa -l"
  alias "lsa"="exa -la"
end
