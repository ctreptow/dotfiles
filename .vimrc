set directory=$HOME/.vim/swapfiles//
set undodir=~/.vim/undo
set undofile
set expandtab             " Expand all tabs to spaces
set tabstop=2             " Spaces used when tab key is pressed
set shiftwidth=2          " Spaces used for indentation
set nu                    " Turn on line numbers
set nocompatible          " We're running Vim, not Vi!
set ruler                 " Show current line and column at bottom right
set smartcase             " Include at least one uppercase character to search in a case-sensitive manner
set number relativenumber " hybrid numbering.  Relative, plus the single absolution line you're on
set colorcolumn=131
" turn off relative numbering in insert mode or when buffer loses focus
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

syntax on                 " Enable syntax highlighting
filetype on               " Enable filetype detection
filetype indent on        " Enable filetype-specific indenting
filetype plugin on        " Enable filetype-specific plugins

set list
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
