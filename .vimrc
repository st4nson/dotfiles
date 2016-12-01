set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'w0ng/vim-hybrid'

Plugin 'fatih/vim-go'
Plugin 'AndrewRadev/splitjoin.vim'

Plugin 'pearofducks/ansible-vim'
Plugin 'hashivim/vim-terraform'

Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

" Plugin 'PProvost/vim-ps1'
" Plugin 'nvie/vim-flake8'
" Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()            " required
filetype plugin indent on    " required

" Theme setup
set term=xterm
set t_Co=256
set background=dark
colorscheme hybrid

" Airline plugin
set laststatus=2  " Always show powerline
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1

" Some Windows customizations
if has("win32")
	let &t_AB="\e[48;5;%dm"
	let &t_AF="\e[38;5;%dm"
	let g:airline_powerline_fonts = 0
	let g:airline_left_sep=''
	let g:airline_right_sep=''

	if has("gui_running")
		set guifont=Consolas:h12
		" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10
		set guioptions-=m  "remove menu bar
		set guioptions-=T  "remove toolbar
		set guioptions-=r  "remove right-hand scroll bar
		set guioptions-=L  "remove left-hand scroll bar
	endif
endif

" Show buffers as tabs
let g:airline#extensions#tabline#enabled = 1

" numbertoggle hotkey remap
let g:NumberToggleTrigger="<leader>n"

"
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start

" Custom list chars
set encoding=utf-8
set listchars=trail:•,tab:\|\ 
set list

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Show line numbers and ruler
set number
set colorcolumn=80

" Disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://sunaku.github.io/vim-256color-bce.html
set t_ut=

set autowrite " autosave files on :make

syntax on

" NERDTree
let g:NERDTreeChDirMode = 2 " switch CWD
nmap <silent> <F7> :NERDTreeToggle<CR>
nmap <silent> <leader><F7> :NERDTreeFind<CR>

" ctrlp
let g:ctrlp_working_path_mode = 'rw' " start search in CWD


" Neocomplete
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1 " Enable neocomplete.
let g:neocomplete#enable_smart_case = 1 " Use smartcase
let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"


" Golang specific
" run :GoBuild or :GoTestCompile based on the go file (vim-go-tutorial)
function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#cmd#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

autocmd FileType go nmap <Leader>d <Plug>(go-doc)

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

