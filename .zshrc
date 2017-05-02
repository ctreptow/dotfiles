. ~/.secrets
eval "$(rbenv init -)"
export COV=1
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

# set so rake will run all the tests after Rails 5
export DISABLE_DATABASE_ENVIRONMENT_CHECK=1

#setopt PROMPT_SUBST
#PROMPT='%{$(pwd|grep --color=always /)%${#PWD}G%} %(!.%F{red}.%F{cyan})%n%f@%F{yellow}%m%f%(!.%F{red}.)%#%f '

if [[ -d ~/Source/zsh-git-prompt ]]; then
  source ~/Source/zsh-git-prompt/zshrc.sh
else
  source ~/src/zsh-git-prompt/zshrc.sh
fi

fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# an example prompt
PROMPT='%B%m%~%b$(git_super_status) %# '
#PROMPT='%B%m~$(git_super_status) %# '

GIT_PROMPT_EXECUTABLE="haskell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# # Example format: plugins=(rails git textmate ruby lighthouse)
# # Add wisely, as too many plugins slow down shell startup.
plugins=(bundler osx rake ruby rails gem brew)

#set up some aliases
alias cdmbc="cd $MBC_WORK_ROOT/mbc"
alias cdhubble="cd $MBC_WORK_ROOT/hubble"
alias uar='$MBC_WORK_ROOT/mbc_tools/scripts/update_all_repos'
alias fmdev='cdmbc && foreman start -f Procfile.dev'
alias fmdevhubble='cdmbc && foreman start -f Procfile.dev -c all=1,hubble=0'
alias be='bundle exec'
alias ber='bundle exec rake'
alias gco='git checkout'
alias gpo='git push -o origin'
alias postgresstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgresstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias gitcleanup='git branch --merged | egrep -v "(^\*|master|develop)" | xargs -n 1 git branch -d'
alias rcc='git diff-tree -r --no-commit-id --name-only master@\{u\} head | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs rubocop'

# added by travis gem
[ -f /Users/Ctreptow/.travis/travis.sh ] && source /Users/Ctreptow/.travis/travis.sh

ulimit -n 1024

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
