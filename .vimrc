:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd ColorScheme * highlight ExtraWhitespace
:match ExtraWhitespace /\s\+$/ "Show trailing whitespace in red"
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
