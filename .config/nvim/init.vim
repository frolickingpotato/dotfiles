"..••°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°••..
"✬ File:            init.vim		                    ✬
"✬ Author:          Albert Kerelis                      ✬
"✬ Description:     My nvim configuration	            ✬
"✬ Proper Home:     ~/.config/nvim/init.vim				✬
"°°••.................................................••°

" TO-DO: Jesse Archer style "set source" for plugins
" https://www.youtube.com/watch?v=434tljD-5C8

"============================================================================================
"								NVIM OPTIONS
"============================================================================================

set relativenumber			" numbers lines you're not on to be relative to the line you're on
set number					" numbers lines
set ignorecase smartcase	" no longer case sensitive, unless search includes caps
set tabstop=4				" tab = 4 spaces
set softtabstop=4			" 4 spaces = tab
set wildmode=longest,list	" tab completions
set shiftwidth=4			" width for autoindent
set autoindent				" indents line if last line was indented
set clipboard=unnamedplus	" use system clipboard
set hidden					" Puts buffer to the background, remembers history
set history=999				" default 20
set undolevels=999			" default 100
set list					" this and next line show leading tabs and trailing spaces 
set listchars=tab:\ ,trail:·
set scrolloff=5				" doesn't let cursor hit end of screen
set sidescrolloff=8
set splitright				" open new split panes to right and below
set splitbelow

"============================================================================================
"								KEYBINDINGS
"============================================================================================

let mapleader="\<space>"

" open selected file in default
nmap <leader>x :!xdg-open %<cr><cr>

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

" Keep lines selected after indenting
vnoremap < <gv
vnoremap > >gv

"============================================================================================
"								PLUGINS
"============================================================================================

call plug#begin()
" Better search function
Plug 'justinmk/vim-sneak'
" Highlights hex values with their color
Plug 'ap/vim-css-color'
" Gives status line
Plug 'itchyny/lightline.vim'
" Autocorrection
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Better start page
Plug 'mhinz/vim-startify'
" Ranger file manager integration
Plug 'francoiscabrol/ranger.vim'
" Comment out shit with gc or gcc
Plug 'preservim/nerdcommenter'
call plug#end()

"=========================================================================================
"									PLUGIN OPTIONS
"=========================================================================================

" Let plugins use filetype information
filetype plugin on

let g:sneak#label = 1
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S

let g:lightline = {
	  \ 'colorscheme': 'wombat',
      \ }


let g:NERDCreateDefaultMappings =1
