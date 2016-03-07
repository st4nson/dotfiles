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

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'w0ng/vim-hybrid'

Plugin 'fatih/vim-go'

Plugin 'PProvost/vim-ps1'

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
let g:airline_theme='light'
let g:airline_powerline_fonts = 1

" Some windows customizations
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
" let g:airline#extensions#tabline#enabled = 1

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

syntax on
