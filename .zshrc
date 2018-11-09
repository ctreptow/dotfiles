function source_if_possible()
{
  if [[ -r $1 ]]; then
    source $1
  fi
}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/Ctreptow/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git osx brew bundler rails
  shrink-path
  zsh-autosuggestions zsh-syntax-highlighting
)

source_if_possible $ZSH/oh-my-zsh.sh

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

#echo "WAT"
source_if_possible ~/.secrets
source_if_possible ~/code/tmuxinator.zsh

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
ulimit -n 4096

[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

eval "$(rbenv init -)"

if [[ -d ~/zsh-git-prompt ]]; then
  source_if_possible ~/zsh-git-prompt/zshrc.sh
else
  source_if_possible ~/Source/zsh-git-prompt/zshrc.sh
fi

PROMPT='%B$(shrink_path -f)$(git_super_status)> '
GIT_PROMPT_EXECUTABLE="haskell"

alias code="cd ~/code"
alias study="cd ~/code/study-notes"
alias goe="cd ~/code/elixir"
alias work="~/code/work/dotfiles/work"
alias kkr="pkill -9 -f 'rb-fsevent|rails|spring|puma|webpack|ruby'"
alias kkz="pkill -9 'zsh'"
alias uar='cd $MBC_WORK_ROOT/mbc_tools; bundle exec $MBC_WORK_ROOT/mbc_tools/scripts/update_all_repos'
alias gl='git log --oneline --decorate --graph --stat'
alias postgresstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgresstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias gitcleanup='git branch --merged | egrep -v "(^\*|master|develop)" | xargs -n 1 git branch -d'
alias rbc='git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs rubocop'                                               #Before Commit:
alias rbp='git diff-tree -r --no-commit-id --name-only master@\{u\} head | xargs ls -1 2>/dev/null | grep '\.rb$' | grep -v schema | xargs rubocop' #Before Push:
alias tml="tmux list-sessions"       #list running tmux sessions
alias tma="tmux -2 attach -t $1"     #join a current session
alias tmk="tmux kill-session -t $1"  #kill a session
alias mux="tmuxinator"
alias cleanup="brew update; brew upgrade; brew cleanup"

# added by travis gem
[ -f /Users/Ctreptow/.travis/travis.sh ] && source_if_possible /Users/Ctreptow/.travis/travis.sh

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Not sure why I had this set
#export PATH="/usr/local/opt/node@8/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
