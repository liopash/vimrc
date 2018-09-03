set nocompatible              " be iMproved, required

"so ~/.vim/plugins.vim

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'ervandew/supertab'
Plugin 'stephpy/vim-php-cs-fixer'

call vundle#end()            " required
filetype plugin indent on    " required



syntax on

color dracula

set backspace=indent,eol,start
set number                                   "activates line number
set complete=.,w,b,u
set synmaxcol=200
set laststatus=2  			     "lightline fix for single tab"
let mapleader = ','
let NERDTreeHijackNetrw = 0
let g:ultisnips_php_scalar_types = 1
let g:php_cs_fixer_verbose = 1
"----- mappings -----"


nmap <Leader>ev :tabedit $MYVIMRC<cr> 
	" Make it easy to edit vimrc " 

nmap  <Leader>t :tabn <cr>
	" move between tabs "

nmap <Leader><space> :nohlsearch <cr>
	" switch off highligts"

nmap <c-R> :CtrlPBufTag<cr>:

nmap <c-e> :CtrlPMRUFiles<cr>

vmap <Leader>k :norm i//<cr>

vmap <Leader>uk :norm xx<cr>


"-------------Plugins--------------"
""/
"/ CtrlP
""/
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|vendor'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"/
"/ Greplace
"/
set grepprg=ag

let g:grep_cmd_opts = '--line-numbers --noheading'

"----- visuals -----"
set t_CO=256  			   "use 256 colors / terminal"
hi LineNr ctermfg=238
hi vertsplit ctermfg=bg ctermbg=bg
"----- searching -----"

set hlsearch 
set incsearch


" Autocommand for save on vimrc "
augroup autosourcing 
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

function! IPhpExpandClass()
	    call PhpExpandClass()
	        call feedkeys('a', 'n')
	endfunction
	autocmd FileType php inoremap <Leader>n <Esc>:call IPhpExpandClass()<CR>
	autocmd FileType php noremap <Leader>n :call PhpExpandClass()<CR>
