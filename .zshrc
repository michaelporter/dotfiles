# switch and save the current path
function cd() {
  builtin cd "$@";
  echo "$PWD" > ~/.cwd;
}
export cd
alias cwd='cd "$(cat ~/.cwd)"'

cwd

PROMPT='%% '

autoload -U zutil
autoload -U compinit
autoload -U complist
compinit
