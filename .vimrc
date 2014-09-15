execute pathogen#infect()
set nocompatible
filetype plugin indent on " enable fietype-specific indenting and pugins

syntax on   " enable syntax highlighting

let mapleader = ","

colorscheme wombat256mod " awesome color scheme
set t_Co=256 " set terminal colors to 256

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number

set backspace=indent,eol,start "backspace over these
set cursorline cursorcolumn " precise targetting of words
set complete=.,w,b,u,U,t,i,d

set scrolloff=5 "keep at least 5 lines above/below

" Sane movements
nnoremap j gj
nnoremap k gk

" Search settings
set hlsearch " highlight all matches of a search
set incsearch " searches as you type

" Turns off highlight using this key map
map <C-c> :noh<cr>

" Window switching
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" treats pattern as case insenstive when all small letters
set ignorecase smartcase

" disable folding for markdown files
let g:vim_markdown_folding_disabled=1

" highlight certain columns
set colorcolumn=80,120
:hi ColorColumn ctermbg=238 " set it to light grey

" shortcuts for buffere manipulation
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> ]B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

set hidden

""""""""""""""""""""""""""""""
" Shortcuts for saving files "
""""""""""""""""""""""""""""""
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
      \| if empty(bufname('%'))
      \|        browse confirm write
      \| else
      \|   confirm write
      \| endif

" Allows saving the file using Ctrl-S in normal and insert mode
" Note that this requires terminal to ignore Ctrl-S
" for most terminal just add this to your .bashrc
"     stty -ixon
nnoremap <C-S> :<C-u>update<CR>
inoremap <c-s> <c-o>:update<CR>

" NERDTree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>

" vim-airline config
