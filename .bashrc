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

# added by travis gem
[ -f /Users/Ctreptow/.travis/travis.sh ] && source /Users/Ctreptow/.travis/travis.sh
