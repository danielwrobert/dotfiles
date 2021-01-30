" don't bother with vi compatibility - required for Vundle as well
set nocompatible

" Enable syntax highlighting
syntax enable

" Vundle
filetype on          " without this vim emits a zero exit status, later, because of :ft off
filetype off         " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on    " required
" End Vundle Configuration

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
" set gdefault
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
" Highlight current line
set cursorline
" Toggle highlighting on and off (mainly for comment contrast)
nnoremap <Leader>c :set cursorline!<CR>
"highlight LineNr ctermfg=grey ctermbg=237
"highlight CursorLineNr ctermfg=grey ctermbg=235
"highlight CursorLine term=bold cterm=bold ctermbg=235
" Show “invisible” characters
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
"set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Easier paste format toggling
set pastetoggle=<F3>

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root in case you forgot to sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enter cleans the search highlight
nnoremap <CR> :nohlsearch<cr>

" Automatic commands
if has("autocmd")
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

" keyboard shortcuts and remappings
" quicker window switching
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" convenient copy & paste to clipboard (mac only)
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
    imap <C-v><C-v> <Esc>:r !pbpaste<CR>
  endif
endif

" highlight .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

" specific filetype settings
autocmd BufNewFile,BufRead *.scss set filetype=scss
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

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

" plugin settings:
" ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" nerdtree
nnoremap <leader>b :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" syntastic
let g:syntastic_php_phpcs_args = "--standard=WordPress-Extra"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" airline
" Enables tabline at top to show buffers as tabs:
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" vim-jsx
let g:jsx_ext_required = 0     " adds support

" emmet
" Sets Leader key to control + Z. So expand keys are `control + Z + ,`
let g:user_emmet_leader_key='<C-Z>'

" prettier
" enable vim-prettier to run in files without requiring the "@format" doc tag.
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

" The Silver Searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" Color scheme settings:
" Setup for Base16 color schemes
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256  " Access colors present in 256 colorspace
  source ~/.vimrc_background
endif
colorscheme base16-ocean
" Airline colors
"let g:airline_theme='solarized'
let g:airline_theme='violet' " Better Airline theme when Dracula is active
"let g:airline_theme='base16_ocean'