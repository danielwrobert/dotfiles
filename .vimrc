" From MacVim Nettuts Video 1 (added 6.6.13):
" Set Colorscheme (MacVim)
"colorscheme railscat
" Enable Syntax Highlighting
syntax on
" Enable Line Numbers
set number
" Set tabs to 4 spaces
set tabstop=4
" Set shift width indent
set shiftwidth=4
" Set font styles
" set guifont=Courier:h15
" Set Code Editor Indenting
set smartindent
set autoindent
" Set Autocompletion
set wildmode=list:longest
" Enable Tree Folding
set foldenable

" From Mathias Dotfiles (added 6.6.13):
" Highlight current line
set cursorline
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