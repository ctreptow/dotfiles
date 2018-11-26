" VUNDLE:
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" 90% talk (https://www.youtube.com/watch?v=XA2WjJbmmoM)
set nocompatible          " We're running Vim, not Vi!
" enable syntax and plugins (for netrw)
syntax enable             " Enable syntax highlighting
filetype plugin on        " Enable filetype-specific plugins

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" Create the `tags` file (may need to install ctags first)
" ! makes it run as a shell command
command! MakeTags !ctags -R .

" NOW WE CAN:
" ^ is CTRL (control key)
" - Use ^] to jump to tag under cursor
" - Use g^] for amgiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" Autocomplete
" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

" Tweaks for file browsing (not required)
" netrw is a plugin, but comes with vim and is loaded by default
let g:netrw_banner=0         " disable annoying banner
let g:netrw_browse_split=4   " open in prior window
let g:netrw_altv=1           " open splits to the right
let g:netrw_liststyle=3      " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

" SNIPPETS:
" skipping - too complex, and not that useful for me

" BUILD INTEGRATION:
" skipping - available plugins are better than this

" PLUGINS USED:
" vundle
" nerdtree
" vim-elixir
" vim-ruby heredoc syntax
" tim pope's


" stuff I had before that I like
set undodir=~/.vim/undo
set undofile
set expandtab             " Expand all tabs to spaces
set tabstop=2             " Spaces used when tab key is pressed
set shiftwidth=2          " Spaces used for indentation
set nu                    " Turn on line numbers
set number relativenumber " hybrid numbering.  Relative, plus the single absolution line you're on
set colorcolumn=81
"" turn off relative numbering in insert mode or when buffer loses focus
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
filetype on               " Enable filetype detection
filetype indent on        " Enable filetype-specific indenting
filetype plugin on        " Enable filetype-specific plugins

" don't litter directories with vim swapfiles
" set backupdir=$TMPDIR//
" set directory=$TMPDIR//
set directory=$HOME/.vim/swapfiles//
set backupdir=$HOME/.vim/backupdir//

set scrolloff=1           " always show at least one line above or below the cursor
set sidescrolloff=5

set list                  "visible whitespace
" set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

set ruler                 " Show current line and column at bottom right

" previous to talk
"set directory=$HOME/.vim/swapfiles//
"set smartcase             " Include at least one uppercase character to search in a case-sensitive manner
