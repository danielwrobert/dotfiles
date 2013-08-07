"####### Pathogen Initialization #######
call pathogen#infect()
call pathogen#helptags()

"####### From MacVim Nettuts Video 1 (added 6.6.13): #######
" Enable Syntax Highlighting
syntax on
" Enable Line Numbers
set number
" Set tabs to 4 spaces
set tabstop=4
" Set shift width indent
set shiftwidth=4
" Set Code Editor Indenting
set smartindent
set autoindent
" Set Autocompletion
set wildmode=list:longest
" Enable Tree Folding
set foldenable

"####### From Mathias Dotfiles (added 6.6.13): #######
" Enhance command-line completion
set wildmenu
" Don’t add empty newlines at the end of files
set binary
set noeol
" Highlight current line
set cursorline
" Show “invisible” characters
"# set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"# set list
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
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd

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

let g:user_zen_expandabbr_key = '<s-tab>'



"####### From Kam's Dotfiles - https://github.com/kamykaze/dotfiles/blob/master/_vimrc #######
"####### Command Remappings: #######
nnoremap <leader><tab> :NERDTree<CR>


"##### Window Navagation #####
" Quicker Window Switching
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


"####### Specific Filetype Settings #######
autocmd BufNewFile,BufRead *.scss set filetype=scss
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,htmldjango,css,scss,less set tabstop=2
autocmd FileType html,htmldjango,css,scss,less set softtabstop=2
autocmd FileType html,htmldjango,css,scss,less set shiftwidth=2
"adds auto-close brackets for css files
autocmd FileType scss,css,javascript imap <buffer> { {<CR>}<Esc>ko<tab>


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
