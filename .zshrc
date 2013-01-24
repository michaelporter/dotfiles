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

bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

alias aron='./arduino_interact -b 9600 -p /dev/tty.usbmodem1421 -s 1'
alias aroff='./arduino_interact -b 9600 -p /dev/tty.usbmodem1421 -s 0'

alias c='clear'
alias lear='clear'
alias leac='clear'
alias alce='clear'
alias claer='clear'
alias cealr='clear'
alias sclear='clear'
alias lclear='clear'
alias lcear='clear'
alias ckear='clear'
alias celar='clear'
