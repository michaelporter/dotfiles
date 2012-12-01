# switch and save the current path
function cd() {
  builtin cd "$@";
  echo "$PWD" > ~/.cwd;
}
export cd
alias cwd='cd "$(cat ~/.cwd)"'

cwd
