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
#alias vi='~/vim'
#alias vim='mvim -v'

alias aron='./arduino_interact -b 9600 -p /dev/tty.usbmodem1421 -s 1'
alias aroff='./arduino_interact -b 9600 -p /dev/tty.usbmodem1421 -s 0'

alias redis='redis-server /usr/local/etc/redis.conf'

alias pass='rdo passenger start'

alias k='kill -9'

alias gt='git'
alias s='git status'
alias dfg='git difftool'
alias gits='git status'
alias gph='git push; git push heroku master'
alias gp='git pulls'

alias o='open'

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
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/bin/npm

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

eval "$(rbenv init -)"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
