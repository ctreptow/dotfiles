. ~/.secrets
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export DISABLE_DATABASE_ENVIRONMENT_CHECK=1
export RUBY_GC_MALLOC_LIMIT=100000000

export RUBY_FREE_MIN=500000
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_GC_HEAP_FREE_SLOTS=500000
export RUBY_GC_HEAP_INIT_SLOTS=1000000

export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export MBC_HOST=http://localhost:3000
export REDIRECT_SIGN_IN_TO_DOMINO=false
export MBC_WORK_ROOT=$HOME/Work

if [[ -d ~/Source/zsh-git-prompt ]]; then
  source ~/Source/zsh-git-prompt/zshrc.sh
else
  source ~/src/zsh-git-prompt/zshrc.sh
fi

# an example prompt
PROMPT='%1d$(git_super_status) %# '

GIT_PROMPT_EXECUTABLE="haskell"

#set up some aliases
alias cdmbc="cd $MBC_WORK_ROOT/mbc"
alias cdhubble="cd $MBC_WORK_ROOT/hubble"
alias uar='$MBC_WORK_ROOT/mbc_tools/scripts/update_all_repos'
alias fmdev='cdmbc && foreman start -f Procfile.dev'
alias fmdevhubble='cdmbc && foreman start -f Procfile.dev -c all=1,hubble=0'

alias rdbr='rake db:reset'
alias rdbm='rake db:migrate'
alias rdbrb='rake db:rollback'

alias gco='git checkout'

alias postgresstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgresstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias gitcleanup='git branch --merged | egrep -v "(^\*|master|develop)" | xargs -n 1 git branch -d'

# added by travis gem
[ -f /Users/Ctreptow/.travis/travis.sh ] && source /Users/Ctreptow/.travis/travis.sh

ulimit -n 1024
