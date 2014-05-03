execute pathogen#infect()
syntax on   " enable syntax highlighting
filetype plugin indent on " enable fietype-specific indenting and pugins

let mapleader = ","

colorscheme wombat256mod " awesome color scheme
set t_Co=256 " set terminal colors to 256

set smartindent
set tabstop=4
set shiftwidth=2
set expandtab
set number

set backspace=indent,eol,start "backspace over these
set cursorline cursorcolumn " precise targetting of words
set complete=.,w,b,u,U,t,i,d

set scrolloff=5 "keep at least 5 lines above/below

" Search settings
set hlsearch " highlight all matches of a search
set incsearch " searches as you type
"turns off highlight using this key map
map <C-h> :noh<cr>
" treats pattern as case insenstive when all small letters
set ignorecase smartcase

" disable folding for markdown files
let g:vim_markdown_folding_disabled=1

" highlight certain columns
set colorcolumn=80,120
:hi ColorColumn ctermbg=238 " set it to light grey


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
      \|endif

" Allows saving the file using Ctrl-S in normal and insert mode
" Note that this requires terminal to ignore Ctrl-S
" for most terminal just add this to your .bashrc
"     stty -ixon
nnoremap  <C-S> :<C-u>Update<CR>
inoremap <c-s> <c-o>:Update<CR>

kk
