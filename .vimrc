" $HOME/.vimrc
 :set directory=$HOME/.vim/swapfiles//

" GUTENTAGS
"
"set one location for tags
let g:gutentags_cache_dir="~/.vim/tags"

let g:gutentags_project_info = []
call add(g:gutentags_project_info, {"type": "go"})
let g:gutentags_ctags_executable_go = 'gotags'

"set list of directories to exclude when generating tags
let g:gutentags_ctags_exclude=["node_modules","plugged","tmp","temp","log","vendor"]
let g:gutentags_resolve_symlinks = 1

" ALE
" let g:ale_emit_conflict_warnings = 0
" let g:ale_sign_warning = '▲'
" let g:ale_sign_error = '✗'
" let g:ale_sign_column_always = 1
" highlight link ALEWarningSign String
" highlight link ALEErrorSign Title

" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
set rtp+=/usr/local/opt/fzf
" set rtp+=/usr/local/bin/fzf
" set rtp+=~/.fzf
" nmap ; :Buffers<CR>
" nmap <Leader>r :Tags<CR>
" nmap <Leader>t :Files<CR>
" nmap <Leader>a :Ag<CR>

" Lightline
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

" autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" GitGutter
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" :highlight ExtraWhitespace ctermbg=red guibg=red
" :highlight SignColumn ctermbg=Black

" augroup vimrc_autocmds
"   autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#111111
"   autocmd BufEnter * match OverLength /\%120v.*/
" augroup END

" :autocmd ColorScheme * highlight ExtraWhitespace
" :match ExtraWhitespace /\s\+$/ "Show trailing whitespace in red"
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

" for any plugins that use this, make their keymappings use comma
let mapleader = ","
let maplocalleader = ","

let g:elm_format_autosave = 1

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin 'sheerun/vim-polyglot'
" Plugin 'tpope/vim-bundler'
" Plugin 'tpope/vim-rails'
" Plugin 'thoughtbot/vim-rspec'
" Plugin 'tpope/vim-cucumber'
" Plugin 'tpope/vim-haml'
" Plugin 'tpope/vim-fugitive'
" Plugin 'posva/vim-vue'
" Plugin 'w0rp/ale'
Plugin 'elmcast/elm-vim'
Plugin 'elixir-lang/vim-elixir'
" Plugin 'elixir-editors/vim-elixir'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ludovicchabant/vim-gutentags'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
