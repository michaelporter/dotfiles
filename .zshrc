source ~/.zprofile

# switch and save the current path
function cd() {
  builtin cd "$@";
  echo "$PWD" > ~/.cwd;
}
export cd
alias cwd='cd "$(cat ~/.cwd)"'

cwd

PROMPT='%% '

export EDITOR='vim'
export BUNDLER_EDITOR='vim'

autoload -U zmv
alias mmv='noglob zmv -W'

autoload -U zutil
autoload -U compinit
autoload -U complist
compinit

# enables delete functionality on command line
bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

HISTSIZE=150
SAVEHIST=150
HISTFILE=~/.zsh_history

# shouldn't be necessary, but for some reason vi is linking to graphical MacVim
alias vi='~/vim'
alias vim='mvim -v'

alias aron='./arduino_interact -b 9600 -p /dev/tty.usbmodem1421 -s 1'
alias aroff='./arduino_interact -b 9600 -p /dev/tty.usbmodem1421 -s 0'

alias redis='redis-server /usr/local/etc/redis.conf'

alias pass='rdo passenger start'

alias k='kill -9'

alias curr='echo `rvm current`'
export curr=`rvm current`

alias gt='git'
alias s='git status'
alias dfg='git difftool'
alias gits='git status'
alias gph='git push; git push heroku master'
alias gp='git pulls'

alias o='open'

alias rdo='rvm default do '
alias migrate='rake db:migrate --trace'
alias recreatedb='rdo rake db:drop; rdo rake db:create; rdo rake db:migrate --trace; rdo rake db:seed --trace'

alias brewdb='mysql -u brewer -D brewcrate_subscription_development -p'

alias c='clear'
alias lear='clear'
alias leac='clear'
alias alce='clear'
alias clar='clear'
alias cler='clear'
alias claer='clear'
alias cealr='clear'
alias sclear='clear'
alias lclear='clear'
alias lcear='clear'
alias ckear='clear'
alias celar='clear'
alias clera='clear'
alias clesr='clear'

# fix slow git tab completion by coopting with zsh file completion
__git_files () { 
  _wanted files expl 'local files' _files     
}

# Other Config Notes
#
#   To enable holding down a key in Sublime Vintage to work like Vim, instead of OSX Lion default
#   defaults write com.sublimetext.2 ApplePressAndHoldEnabled -bool false

# Oh-My-Zsh config follows
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
 DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git, rails3)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# postgres start
#pg_ctl -D /usr/local/var/postgres -l logfile start
#pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log stop

# Customize to your needs...
export PATH=/usr/local/bin:/Users/michael/.rvm/gems/ruby-1.9.3-p392@stackpop/bin:/Users/michael/.rvm/gems/ruby-1.9.3@bread/bin:/Users/michael/.rvm/gems/ruby-1.9.3-p392@global/bin:/Users/michael/.rvm/rubies/ruby-1.9.3-p392/bin:/Users/michael/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/michael/.rvm/bin:/usr/local/bin/npm

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
