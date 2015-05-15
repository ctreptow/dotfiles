. ~/.secrets
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
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

alias uar='$MBC_WORK_ROOT/mbc_tools/scripts/update_all_repos'
alias fmdev='cd $MBC_WORK_ROOT/mbc && foreman start -f Procfile.dev'

#setopt PROMPT_SUBST
#PROMPT='%{$(pwd|grep --color=always /)%${#PWD}G%} %(!.%F{red}.%F{cyan})%n%f@%F{yellow}%m%f%(!.%F{red}.)%#%f '

if [[ -d ~/Source/zsh-git-prompt ]]; then
  source ~/Source/zsh-git-prompt/zshrc.sh
else
  source ~/src/zsh-git-prompt/zshrc.sh
fi

# an example prompt
PROMPT='%B%m%~%b$(git_super_status) %# '
#PROMPT='%B%m~$(git_super_status) %# '

GIT_PROMPT_EXECUTABLE="haskell"
