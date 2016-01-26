" ####### Begin Vundle Configuration #######
" First you need to install Vundle: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible     " be iMproved, required
filetype off         " required
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" Additional plugins
" Keep Plugin commands between vundle#begin/end.
" CTRL+P - https://github.com/ctrlpvim/ctrlp.vim
Plugin 'ctrlpvim/ctrlp.vim'
" Editorconfig - https://github.com/editorconfig/editorconfig-vim
Plugin 'editorconfig/editorconfig-vim'
" Emmet Vim - https://github.com/mattn/emmet-vim
Plugin 'mattn/emmet-vim'
" GoYo - https://github.com/junegunn/goyo.vim
Plugin 'junegunn/goyo.vim'
" NERD Commenter - https://github.com/scrooloose/nerdcommenter
Plugin 'scrooloose/nerdcommenter'
" NERD Tree - https://github.com/scrooloose/nerdtree
" Plugin 'scrooloose/nerdtree'
" Syntastic - https://github.com/scrooloose/syntastic
Plugin 'scrooloose/syntastic'
" Vim Airline - https://github.com/bling/vim-airline
Plugin 'bling/vim-airline'
" Vim BufOnly - https://github.com/schickling/vim-bufonly
Plugin 'schickling/vim-bufonly'
" Vim Solarized (Color Scheme) - https://github.com/altercation/vim-colors-solarized
Plugin 'altercation/vim-colors-solarized'
" Vim EasyMotion - https://github.com/Lokaltog/vim-easymotion
Plugin 'Lokaltog/vim-easymotion'
" Vim Surround  - https://github.com/tpope/vim-surround
Plugin 'tpope/vim-surround'
" Vim Vinegar  - https://github.com/tpope/vim-vinegar
" Plugin 'tpope/vim-vinegar'
" YouCompleteMe  - https://github.com/Valloric/YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" "filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" ####### End Vundle Configuration #######


" ####### From MacVim Nettuts Video 1 (added 6.6.13): #######
" Set tabs to 4 spaces
set tabstop=4
" Set softtabs - spaces as tabs
set softtabstop=4
" Set shift width indent
set shiftwidth=4
" Set Code Editor Indenting
set smartindent
set autoindent
" Set Autocompletion
set wildmode=list:longest
" Enable Tree Folding
set foldenable
" Set Colorscheme
" let g:hybrid_use_Xresources=1
" colorscheme flattown
" colorscheme seti
set background=dark
colorscheme solarized

" ####### VIM-CTRL-P Settings: #######
set runtimepath^=~/.vim/bundle/ctrlp.vim

" ####### From Mathias Dotfiles (updated 9.3.13): #######
" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
" #set tabstop=2
" Show “invisible” characters
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set lcs=tab:\|\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

" Enable filetype plugins (nerdcommenter - https://github.com/scrooloose/nerdcommenter)
filetype plugin on

" ####### From Kam's Dotfiles - https://github.com/kamykaze/dotfiles/blob/master/_vimrc #######
" ####### Command Remappings: #######
nnoremap <leader><tab> :NERDTree<CR>
let g:NERDTreeDirArrows=0

" ##### Window Navagation #####
" Quicker Window Switching
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" ##### Convenient Copy & Paste to Clipboard (Mac only) #####
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
    imap <C-v><C-v> <Esc>:r !pbpaste<CR>
  endif
endif

" ####### Specific Filetype Settings #######
autocmd BufNewFile,BufRead *.scss set filetype=scss
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"add auto-close curly-braces
autocmd FileType html,css,scss,javascript,php inoremap <buffer> { {}<Left>
autocmd FileType html,css,scss,javascript,php inoremap <buffer> {} {}
autocmd FileType html,css,scss,javascript,php inoremap <buffer> {<CR> {<CR>}<Esc>O
autocmd FileType htmldjango inoremap <buffer> {{ {{<space><space>}}<Left><Left><Left>
autocmd FileType htmldjango inoremap <buffer> {% {%<space><space>%}<Left><Left><Left>

"add auto-close parenthesis
autocmd FileType html,css,scss,javascript,php inoremap <buffer> ( ()<Left>

"add auto-close brackets
autocmd FileType html,css,scss,javascript,php inoremap <buffer> [ []<Left>

"add auto-close quotes
autocmd FileType html,css,scss,javascript,php inoremap <buffer> ' ''<Left>
autocmd FileType html,css,scss,javascript,php inoremap <buffer> " ""<Left>

" ####### Syntastic Plugin Settings: #######
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ####### Airline Plugin Settings: #######
" Enables tabline at top to show buffers as tabs:
let g:airline#extensions#tabline#enabled = 1

" ####### VIM-JSX Settings: #######
" adding Vim-JSX (https://github.com/mxw/vim-jsx) support
" let g:jsx_ext_required = 0
" let g:jsx_pragma_required = 1

" ####### ZenCoding/Emmet Settings and Remappings: #######
" adding zen coding (http://code.google.com/p/zen-coding/ ) support
let g:user_emmet_leader_key = '<C-n>'
let g:user_emmet_expandabbr_key = '<s-tab>'
let g:user_emmet_togglecomment_key = '<c-_>'
"let g:user_emmet_next_key = '<C-,>'
"let g:user_emmet_prev_key = '<C-;>'

" ####### Toggle Paste Tabs #######
" Provides visual feedback shown in the status line
" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <F13> :set invpaste paste?<CR>
set pastetoggle=<F13>
set showmode

" ####### Base-16 Color Scheme Accent Color Setting #######
let base16colorspace=256  " Access colors present in 256 colorspace
