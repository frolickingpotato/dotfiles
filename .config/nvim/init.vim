call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'justinmk/vim-sneak'
Plug 'ap/vim-css-color'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
call plug#end()

let g:sneak#label = 1
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

nmap C-tab <Plug>g:NERDTreeToggle

" open new split panes to right and below
set splitright
set splitbelow

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>

set relativenumber			" numbers lines you're not on to be relative to the line you're on
set number					" numbers lines
set visualbell				" errors are visual, not auditory
set showmatch				" show matching
set ignorecase				" no longer case sensitive
set tabstop=4				" tab = 4 spaces
set softtabstop=4			" 4 spaces = tab
set spell					" spell correction
set wildmode=longest,list	" tab completions
set mouse=a					" enable mouse click
set shiftwidth=4			" width for autoindent
set autoindent				" indents line if last line was indented
set mouse=v					" middleclick paste
set clipboard=unnamedplus	" use system clipboard
set foldmethod=indent
set foldnestmax=1
set foldlevelstart=1
set noshowmode
