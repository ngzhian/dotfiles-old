set enc=utf-8
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
" Plugin 'klen/python-mode' " runs slow on my com, disable it
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'

" ultisnips snippets
Plugin 'honza/vim-snippets'
call vundle#end()
filetype plugin indent on " enable fietype-specific indenting and pugins

syntax on   " enable syntax highlighting

let mapleader = ","

" source $MYVIMRC reloads the saved $MYVIMRC
:nmap <Leader>s :source $MYVIMRC<cr>
" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
:nmap <Leader>v :e $MYVIMRC<cr>

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

set list listchars=tab:»·,trail:·,extends:>,precedes:<

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

" shortcuts for buffer manipulation
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> ]B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <leader>q :bufdo bd<CR>

set hidden

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

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-x><c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" YouCompleteMe
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>g :YcmCompleter GoToDefinition<CR>

" Buffers
nnoremap <leader>q :bufdo :bd<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.pyc

" For ctrlp
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" For vim-gitgutter
let g:gitgutter_realtime = 0

" For Syntastic in python files
let g:syntastic_python_checkers = ['python', 'pyflakes', 'pep8']
