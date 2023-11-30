"..••°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°••..
"✬ File:            init.vim		                    ✬
"✬ Author:          Albert Kerelis                      ✬
"✬ Description:     My nvim configuration	            ✬
"✬ Proper Home:     ~/.config/nvim/init.vim				✬
"°°••.................................................••°

" TO-DO: Jesse Archer style "set source" for plugins
" https://www.youtube.com/watch?v=434tljD-5C8
" Have write hook only run when working on a .wiki document

"=========================================================================================
"								NVIM OPTIONS
"=========================================================================================

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
set cmdheight=2				" More space for displaying messages
set signcolumn=number
set undofile
set undodir=~/.local/local/share/nvim/undoFiles/

" git push wiki on write
:autocmd BufWritePost *.wiki execute "! nohup sh -c 'cd ~/Documents/Notes/vimwiki ; git add ./*; git commit -m \"write hook\"; git push' &"

"=========================================================================================
"								KEYBINDINGS
"=========================================================================================

let mapleader="\<space>"

" open selected file in default
nmap <leader>x :!xdg-open %<cr><cr>

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" move split panes to left/bottom/top/right - alt+h/j/k/l
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L
" move between panes to left/bottom/top/right - ctrl+h/j/k/l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Keep lines selected after indenting
vnoremap < <gv
vnoremap > >gv

" For when you forget to sudo vim a write-protected file, use :w!!
" >:^~ Write!!
cmap w!! w !sudo tee "%" > /dev/null

"=========================================================================================
"								PLUGINS
"=========================================================================================

call plug#begin()
" Better search function
Plug 'justinmk/vim-sneak'
" Highlights hex values with their color
Plug 'ap/vim-css-color'
" Gives status line
Plug 'itchyny/lightline.vim'
" Better start page
" todo: make a custom and pretty one. Maybe text is centered? With cute ascii
" art of mudkip or maybe puppycat?
Plug 'mhinz/vim-startify'
" Ranger file manager integration
Plug 'francoiscabrol/ranger.vim'
" Toggle comment with <leader> ci
Plug 'preservim/nerdcommenter'
" Browse undo trees
Plug 'jiaoshijie/undotree'
" Language parser, syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter'
" Note-taking, personal database system
Plug 'vimwiki/vimwiki'
" Surround
Plug 'tpope/vim-surround'
" Papis, citation and document manager
Plug 'jghauser/papis.nvim'
" Telescope, Fuzzy finder
Plug 'nvim-telescope/telescope.nvim'
" Lua depency for Telescope
Plug 'nvim-lua/plenary.nvim'
" Rust language stuff
Plug 'rust-lang/rust.vim'
" Closes delimiters (quotations, brackets, etc.)
Plug 'Raimondi/delimitMate'
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

" vimwiki
"
"change vimwiki index path
let g:vimwiki_list = [{'path': '~/Documents/Notes/vimwiki/'}]

"=========================================================================================
"									PLUGIN HELP
"========================================================================================="
" NERDCommenter
"
"Most of the following mappings are for normal/visual mode only.
"The |NERDCommenterInsert| mapping is for insert mode only.

	"<leader>cc |NERDCommenterComment|

	"Comment out the current line or text selected in visual mode.

	"<leader>cn |NERDCommenterNested|

	"Same as cc but forces nesting.

	"<leader>c<space> |NERDCommenterToggle|

	"Toggles the comment state of the selected line(s).
	"If the topmost selected line is commented, all selected lines are
	"uncommented and vice versa.

	"<leader>cm |NERDCommenterMinimal|

	"Comments the given lines using only one set of multipart delimiters.

	"<leader>ci |NERDCommenterInvert|

	"Toggles the comment state of the selected line(s) individually.

	"<leader>cs |NERDCommenterSexy|

	"Comments out the selected lines with a pretty block formatted layout.

	"<leader>cy |NERDCommenterYank|

	"Same as cc except that the commented line(s) are yanked first.

	"<leader>c$ |NERDCommenterToEOL|

	"Comments the current line from the cursor to the end of line.

	"<leader>cA |NERDCommenterAppend|

	"Adds comment delimiters to the end of line and goes into insert mode between them.

	"|NERDCommenterInsert|

	"Adds comment delimiters at the current cursor position and inserts between.
	"Disabled by default.

	"<leader>ca |NERDCommenterAltDelims|

	"Switches to the alternative set of delimiters.

	"<leader>cl |NERDCommenterAlignLeft <leader>cb |NERDCommenterAlignBoth

	"Same as |NERDCommenterComment| except that the delimiters are aligned
	"down the left side (<leader>cl) or both sides (<leader>cb).

	"<leader>cu |NERDCommenterUncomment|

	"Uncomments the selected line(s).

"##############################################################################################################

" Vim Surround
"
"Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. The plugin provides mappings to easily delete, change and add such surroundings in pairs.

"It's easiest to explain with examples. Press cs"' inside

""Hello world!"

"to change it to

"'Hello world!'

"Now press cs'<q> to change it to

"<q>Hello world!</q>

"To go full circle, press cst" to get

""Hello world!"

"To remove the delimiters entirely, press ds".

"Hello world!

"Now with the cursor on "Hello", press ysiw] (iw is a text object).

"[Hello] world!

"Let's make that braces and add some space (use } instead of { for no space): cs]{

"{ Hello } world!

"Now wrap the entire line in parentheses with yssb or yss).

"({ Hello } world!)

"Revert to the original text: ds{ds)

"Hello world!

"Emphasize hello: ysiw<em>

"<em>Hello</em> world!

"Finally, let's try out visual mode. Press a capital V (for linewise visual mode) followed by S<p class="important">.

"<p class="important">
  "<em>Hello</em> world!
"</p>

"This plugin is very powerful for HTML and XML editing, a niche which currently seems underfilled in Vim land. (As opposed to HTML/XML inserting, for which many plugins are available). Adding, changing, and removing pairs of tags simultaneously is a breeze.

"The . command will work with ds, cs, and yss if you install repeat.vim.
