set enc=utf-8
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'bkad/CamelCaseMotion'

" tmux
Plugin 'benmills/vimux'
Bundle 'christoomey/vim-tmux-navigator'

" javascript
Plugin 'pangloss/vim-javascript'

" python related
Plugin 'fisadev/vim-isort'
Plugin 'jmcantrell/vim-virtualenv'
" Plugin 'klen/python-mode' " runs slow on my com, disable it

" less related
Plugin 'groenewege/vim-less'

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

:nmap <Leader>n :lnext<cr>
:nmap <Leader>p :lprev<cr>

" if &term =~ '256color'
    " set t_ut=
" endif
let base16colorspace=256 " Access colors present in 256 colorspace
set background=light " Setting dark mode
colorscheme base16-atelierforest
" set t_Co=256 " set terminal colors to 256
" hi Normal ctermbg=NONE " need this fix for tmux

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number

augroup myfiletypes
    autocmd!
    autocmd FileType javascript setlocal sw=2
    autocmd FileType html setlocal sw=2
    autocmd FileType htmldjango setlocal sw=2
augroup END

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

set list listchars=tab:>-,trail:.,extends:>,precedes:<

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
" nnoremap <C-S> :<C-u>update<CR>
" inoremap <c-s> <c-o>:update<CR>

" NERDTree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>
map <F4> :NERDTreeFind<CR>

" vim-airline config
let g:airline_theme='hybrid'

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
set wildignore+=*/node_modules/*

" For ctrlp
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_funky_matchtype = 'path'

" For vim-gitgutter
let g:gitgutter_realtime = 0

" Syntastic file checkers config
let g:syntastic_python_checkers = ['python', 'pyflakes', 'pep8']
let g:syntastic_javascript_checkers = ['jshint', 'gjslint']

" Vimux
nnoremap <leader>r :VimuxRunLastCommand<CR>
