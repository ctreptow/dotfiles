:highlight ExtraWhitespace ctermbg=red guibg=red
:highlight SignColumn ctermbg=Black

augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#111111
  autocmd BufEnter * match OverLength /\%120v.*/
augroup END

:autocmd ColorScheme * highlight ExtraWhitespace
:match ExtraWhitespace /\s\+$/ "Show trailing whitespace in red"
set expandtab         " Expand all tabs to spaces
set tabstop=2         " Spaces used when tab key is pressed
set shiftwidth=2      " Spaces used for indentation
set nu                " Turn on line numbers
set nocompatible      " We're running Vim, not Vi!
" set colorcolumn=80    " Shows Rubocop's default line length rule
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
