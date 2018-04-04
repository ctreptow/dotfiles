source ~/.secrets
source ~/code/tmuxinator.zsh

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

eval "$(rbenv init -)"

export COV=1
export DISABLE_DATABASE_ENVIRONMENT_CHECK=1    # set so rake will run all the tests after Rails 5
export EDITOR="vim"
export MBC_HOST=http://localhost:3000
export MBC_WORK_ROOT=$HOME/code/work
export PATH="/usr/local/heroku/bin:$PATH"
export REDIRECT_SIGN_IN_TO_DOMINO=false
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_FREE_MIN=500000
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_GC_HEAP_FREE_SLOTS=500000
export RUBY_GC_HEAP_INIT_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1

export GOPATH=$HOME/code/go

if [[ -d ~/Source/zsh-git-prompt ]]; then
  source ~/Source/zsh-git-prompt/zshrc.sh
else
  source ~/src/zsh-git-prompt/zshrc.sh
fi

fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

PROMPT='%B%m%~%b$(git_super_status) %# '
GIT_PROMPT_EXECUTABLE="haskell"

plugins=(bundler osx rake ruby rails gem brew)   # Add wisely, as too many plugins slow down shell startup.

alias code="cd ~/code"
alias study="cd ~/code/study-notes"
alias work="~/dotfiles/work"
alias kkk="pkill -9 -f 'rb-fsevent|rails|spring|puma|webpack|ruby'"
alias kkz="pkill -9 'zsh'"
alias uar='cd $MBC_WORK_ROOT/mbc_tools; bundle exec $MBC_WORK_ROOT/mbc_tools/scripts/update_all_repos'
alias fmdev='mbc && foreman start -f Procfile.dev'
alias fmdevhubble='mbc && foreman start -f Procfile.dev -c all=1,hubble=0'
alias fmdevmbc='mbc && foreman start -f Procfile.dev -c all=1,mbc=0'
alias be='bundle exec'
alias ber='bundle exec rake'
alias gco='git checkout'
alias gpo='git push -o origin'
alias gl='git log --oneline --decorate --graph --stat'
alias postgresstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgresstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias gitcleanup='git branch --merged | egrep -v "(^\*|master|develop)" | xargs -n 1 git branch -d'
alias rbc='git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs rubocop'                                               #Before Commit:
alias rbp='git diff-tree -r --no-commit-id --name-only master@\{u\} head | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs rubocop' #Before Push:
alias tml="tmux list-sessions"       #list running tmux sessions
alias tma="tmux -2 attach -t $1"     #join a current session
alias tmk="tmux kill-session -t $1"  #kill a session
alias mux="tmuxinator"
alias cleanup="brew update; brew upgraade; brew cleanup"

# added by travis gem
[ -f /Users/Ctreptow/.travis/travis.sh ] && source /Users/Ctreptow/.travis/travis.sh

ulimit -n 4096
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/Ctreptow/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
