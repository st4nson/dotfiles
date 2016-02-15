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

Plugin 'w0ng/vim-hybrid'

Plugin 'nvie/vim-flake8'

" Plugin 'fatih/vim-go'
" Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()            " required
filetype plugin indent on    " required

" Theme setup
set t_Co=256
set background=dark
colorscheme hybrid

" Airline plugin
set laststatus=2  " Always show powerline
let g:airline_theme='light'
let g:airline_powerline_fonts = 1
" set guifont=Liberation\ Mono\ for\ Powerline\ 8
" Show buffers as tabs
" let g:airline#extensions#tabline#enabled = 1

"
set tabstop=4
set shiftwidth=4

" Custom list chars
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

syntax on
