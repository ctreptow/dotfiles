" set the runtime path to include Vundle and initialize
" rscheme solarized8_dark
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-cucumber'
Plugin 'lifepillar/vim-solarized8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

colorscheme solarized8_dark_low

match ErrorMsg '\s\+$'

set expandtab         " Expand all tabs to spaces
set tabstop=2         " Spaces used when tab key is pressed
set shiftwidth=2      " Spaces used for indentation
set nu                " Turn on line numbers
set nocompatible      " We're running Vim, not Vi!
set laststatus=2      " Show status line
set statusline+=%f    " Show relative file path
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
" Make it obvious where 80 characters is
set textwidth=120
set colorcolumn=+1
set relativenumber    " relative line numbers are the shit
