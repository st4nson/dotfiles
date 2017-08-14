set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Git stuff
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Eye candy
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0ng/vim-hybrid'
Plugin 'arcticicestudio/nord-vim'
Plugin 'guns/xterm-color-table.vim'

" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'
Plugin 'qpkorr/vim-bufkill'
Plugin 'easymotion/vim-easymotion'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Auto completion
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

"
Plugin 'fatih/vim-go'
Plugin 'pearofducks/ansible-vim'
Plugin 'hashivim/vim-terraform'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'majutsushi/tagbar'

"
Plugin 'tpope/vim-dispatch'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'w0rp/ale'
Plugin 'jpalardy/vim-slime'
Plugin 'vimwiki/vimwiki'

Plugin 'NBUT-Developers/extra-instant-markdown'
" Plugin 'PProvost/vim-ps1'
" Plugin 'nvie/vim-flake8'
" Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()            " required
filetype plugin indent on    " required

"" Theme setup
set term=xterm
set t_Co=256
set background=dark

let g:nord_italic_comments = 1
colorscheme nord


"" Airline plugin
set laststatus=2  " Always show powerline
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1

"" Show buffers as tabs
let g:airline#extensions#tabline#enabled = 1

"" numbertoggle hotkey remap
let g:NumberToggleTrigger="<leader>n"

"
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start

"" Custom list chars
set encoding=utf-8
set listchars=eol:↵,trail:•,tab:\|\ 
set list

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Show line numbers and ruler
set number
set colorcolumn=81

" Disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
" see also http://sunaku.github.io/vim-256color-bce.html
set t_ut=

set autowrite      " autosave files on :make
set updatetime=250 " update each 250ms
set synmaxcol=250  " syntax hi. only for first 250 chars. Speed improvement for
                   " files with long lines

syntax on

"" sudo write
cmap w!! w !sudo tee % >/dev/null

"" buffers navigation
nmap <silent> <leader>[ :bprevious<CR>
nmap <silent> <leader>] :bnext<CR>
nmap <silent> <leader>; :BD<CR>

"" Tagbar
nmap <silent> <F8> :TagbarToggle<CR>

"" NERDTree
let g:NERDTreeChDirMode = 2 " switch CWD
nmap <silent> <F7> :NERDTreeToggle<CR>
nmap <silent> <leader><F7> :NERDTreeFind<CR>

"" fzf
nmap <silent> <C-p> :FZF<CR>
nmap <silent> <leader>' :Buffers<CR>
nmap <silent> <leader>q :Tags<CR>
imap <c-x><c-l> <plug>(fzf-complete-line)

"" SuperTab
let g:SuperTabClosePreviewOnPopupClose = 1

" set completeopt-=preview

"" Neocomplete
let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
let g:neocomplete#enable_at_startup = 1 " Enable neocomplete.
let g:neocomplete#enable_smart_case = 1 " Use smartcase
let g:neocomplete#sources#syntax#min_keyword_length = 3 " Set minimum syntax keyword length.

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

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

" Neocomplete and vim-multiple-cursors fix
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
	if exists(':NeoCompleteLock')==2
		exe 'NeoCompleteLock'
	endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
	if exists(':NeoCompleteUnlock')==2
		exe 'NeoCompleteUnlock'
	endif
endfunction


"" Golang specific
" run :GoBuild or :GoTestCompile based on the go file (vim-go-tutorial)
function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#cmd#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction

autocmd FileType go nmap <leader>b  :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)

autocmd FileType go nmap <leader>d <Plug>(go-doc)

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" Tagbar config
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

"" Python specific
" autocmd FileType python map <leader>f :call Flake8()<CR>

"" LineNumber color
" exe ":hi! LineNr ctermfg=238"

"" EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap <leader><leader>s <Plug>(easymotion-overwin-f)
map <leader><leader>j <Plug>(easymotion-j)
map <leader><leader>k <Plug>(easymotion-k)

"" Ale
nmap <silent> ]a <Plug>(ale_next_wrap)
nmap <silent> [a <Plug>(ale_previous_wrap)
"highlight clear ALEErrorSign
"highlight ALEErrorSign ctermfg=1
"
"let g:ale_sign_error = nr2char(10007)
"let g:ale_sign_warning = nr2char(10097)

"" vim-dispatch

"" vim-slime
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

" Fix diffs
highlight DiffAdd term=bold ctermfg=2 ctermbg=0
highlight DiffDelete term=bold ctermbg=0
highlight DiffChange term=bold ctermbg=0

"" Set persistent undo
set undofile
set undodir=~/.vim/undodir

set previewheight=15

"" Vimwiki
let g:vimwiki_list = [{'path': '~/.vimwiki/',
                     \ 'syntax': 'markdown',
                     \ 'ext': '.md'}]
let g:vimwiki_table_mappings = 0

hi VimwikiHeader1 guifg=#afafff ctermfg=147
hi VimwikiHeader2 guifg=#00FF00 ctermfg=10
hi VimwikiHeader3 guifg=#0000FF ctermfg=12
hi VimwikiHeader4 guifg=#FF00FF ctermfg=13
hi VimwikiHeader5 guifg=#00FFFF ctermfg=14
hi VimwikiHeader6 guifg=#FFFF00 ctermfg=11

"" extra-instant-markdown
let g:instant_markdown_autostart = 0
