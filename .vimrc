"####### Pathogen Initialization #######
call pathogen#infect()
call pathogen#helptags()


"####### From MacVim Nettuts Video 1 (added 6.6.13): #######
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
colorscheme flattown


"####### From Mathias Dotfiles (updated 9.3.13): #######
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
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
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

"####### From Kam's Dotfiles - https://github.com/kamykaze/dotfiles/blob/master/_vimrc #######
"####### Command Remappings: #######
nnoremap <leader><tab> :NERDTree<CR>
let g:NERDTreeDirArrows=0

"##### Window Navagation #####
" Quicker Window Switching
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"##### Convenient Copy & Paste to Clipboard (Mac only) #####
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
    imap <C-v><C-v> <Esc>:r !pbpaste<CR>
  endif
endif

"####### Specific Filetype Settings #######
autocmd BufNewFile,BufRead *.scss set filetype=scss
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"add auto-close brackets
autocmd FileType css,scss,javascript inoremap <buffer> { {}<Left>
autocmd FileType css,scss,javascript inoremap <buffer> {} {}
autocmd FileType css,scss,javascript inoremap <buffer> {<CR> {<CR>}<Esc>O
autocmd FileType htmldjango inoremap <buffer> {{ {{<space><space>}}<Left><Left><Left>
autocmd FileType htmldjango inoremap <buffer> {% {%<space><space>%}<Left><Left><Left>

"####### ZenCoding/Emmet Settings and Remappings: #######
" adding zen coding (http://code.google.com/p/zen-coding/ ) support
let g:user_emmet_leader_key = '<C-n>'
let g:user_emmet_expandabbr_key = '<s-tab>'
let g:user_emmet_togglecomment_key = '<c-_>'
"let g:user_emmet_next_key = '<C-,>'
"let g:user_emmet_prev_key = '<C-;>'

""" Other emmet key binding settings """
"-------------------------------------
" user_emmet_expandabbr_key'
" user_emmet_expandword_key'
" user_emmet_balancetaginward_key'
" user_emmet_balancetagoutward_key'
" user_emmet_next_key'
" user_emmet_prev_key'
" user_emmet_imagesize_key'
" user_emmet_togglecomment_key'
" user_emmet_splitjointag_key'
" user_emmet_removetag_key'
" user_emmet_anchorizeurl_key'
" user_emmet_anchorizesummary_key'

" Shortcut summary:
" n  <C-n>A        <Plug>ZenCodingAnchorizeSummary
" n  <C-n>a        <Plug>ZenCodingAnchorizeURL
" n  <C-n>k        <Plug>ZenCodingRemoveTag
" n  <C-n>j        <Plug>ZenCodingSplitJoinTagNormal
" n  <C-n>/        <Plug>ZenCodingToggleComment
" n  <C-n>i        <Plug>ZenCodingImageSize
" n  <C-n>N        <Plug>ZenCodingPrev
" n  <C-n>n        <Plug>ZenCodingNext
" v  <C-n>D        <Plug>ZenCodingBalanceTagOutwardVisual
" n  <C-n>D        <Plug>ZenCodingBalanceTagOutwardNormal
" v  <C-n>d        <Plug>ZenCodingBalanceTagInwardVisual
" n  <C-n>d        <Plug>ZenCodingBalanceTagInwardNormal
" n  <C-n>;        <Plug>ZenCodingExpandWord
" n  <C-n>,        <Plug>ZenCodingExpandNormal
" v  <C-n>,        <Plug>ZenCodingExpandVisual
