" Setting up Vundle - the vim plugin bundler
"let iCanHazVundle=1
"let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
"if !filereadable(vundle_readme)
"  echo "Installing Vundle.."
"  echo ""
"  silent !mkdir -p ~/.vim/bundle
"  silent !git clone git@github.com:gmarik/vundle.git ~/.vim/bundle/vundle
"  let iCanHazVundle=0
"endif
set nocompatible
filetype off
"set rtp+=~/.vim/bundle/vundle/
call plug#begin('~/.vim/plugged')
"let g:vundle_default_git_proto = 'git'
Plug 'nanotech/jellybeans.vim'
"Plug 'gmarik/vundle'
Plug 'vim-scripts/Syntastic'
Plug 'tpope/vim-fugitive'
Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/dash.vim'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/vcscommand.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-markdown'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-abolish.git'
Plug 'sjl/gundo.vim'
Plug 'elzr/vim-json'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree.git'
Plug 'scrooloose/nerdtree'
"Plug 'yakiang/excel.vim'
Plug 'davidhalter/jedi-vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'wellle/tmux-complete.vim'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" Essential
set nocompatible
filetype plugin indent on
set background=dark
set scrolloff=2
set listchars=extends:>,precedes:<,eol:$,trail:.,tab:>-
set ttimeoutlen=0 timeoutlen=2000
" Allow hidden buffers
set hidden

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#enabled = 1
let g:syntastic_python_checkers=['pyflakes', 'pep8'] 

"Indentation
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

"Search
set incsearch
set hlsearch
set ignorecase
set smartcase
set infercase

colorscheme jellybeans
set showcmd
set nojoinspaces
set ruler
set number
set cursorline
set wildmode=full
set wildmenu
set laststatus=2
set nrformats=alpha
syntax on

"Matching braces
set showmatch
set matchtime=3
noremap % v%
set matchpairs+=<:>

"encoding
set encoding=utf8

"key mapping
let mapleader = ","
noremap \ ,
nmap <leader>ew :e <C-R>=expand("%:p:h") . "/"<CR>
nmap <leader>es :sp <C-R>=expand("%:p:h") . "/"<CR>
nmap <leader>ev :vsp <C-R>=expand("%:p:h") . "/"<CR>
nmap <leader>et :tabnew <C-R>=expand("%:p:h") . "/"<CR>
nmap <silent> <leader>a 1GVG
nmap <silent> <leader>l :set list!<CR>
nmap <silent> <leader>n :silent :nohlsearch<CR>
nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>< :bp<CR>
nmap <silent> <leader>> :bn<CR>
nmap <silent> <leader>tt :TagbarToggle<CR>
nmap <silent> <leader>nt :NERDTreeToggle<CR>
nmap <silent> <leader>h :set number!<CR>
nmap <silent> <leader>oe yiW :e <C-r>0<CR>
nmap <silent> <leader>os yiW :sp <C-r>0<CR>
nmap <silent> <leader>v :tabedit $MYVIMRC<CR>
nmap <silent> <leader>ov yiW :vsp <C-r>0<CR>
nmap <silent> <leader>w :set diffopt+=iwhite<CR>
nmap <silent> <leader>W :set diffopt-=iwhite<CR>
nmap <silent> <leader>K <ESC>i<CR><ESC>
nmap <silent> <leader>N <ESC>f,a<CR><ESC>
nmap <silent> gv `[V`]
nnoremap <Space> za
vnoremap <Space> za
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
map <C-h> <C-w> h
map <C-j> <C-w> j
map <C-k> <C-w> k
map <C-l> <C-w> l

"Visual star
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

"Fixing the & command
nnoremap & :&&<CR>
xnoremap & :&&<CR>


"Hiding hlsearch for * and #
nnoremap <silent> * *:nohlsearch<CR>
nnoremap <silent> # #:nohlsearch<CR>

"Python
autocmd FileType python nmap <buffer> <silent> <leader>/ I#<ESC>j
autocmd FileType python xnoremap <buffer> <silent> <leader>pdb i__import__('pdb').set_trace()<ESC>==j
autocmd Filetype python nmap <buffer> <F5> :!python %<CR>
autocmd Filetype python setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd Filetype markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.*annotatedstring setlocal noautoindent noexpandtab
autocmd BufWritePost .vimrc source $MYVIMRC
autocmd FileType json set foldmethod=syntax 

" file is large from 50mb
let g:LargeFile = 1024 * 1024 * 50
augroup LargeFile
  autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
  " no syntax highlighting etc
  set eventignore+=FileType
  " save memory when other file is viewed
  setlocal bufhidden=unload
  " is read-only (write with :w new_filename)
  setlocal buftype=nowrite
  " no undo possible
  setlocal undolevels=-1
  " display message
  autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

let g:tmux_navigator_save_on_switch = 2

function FormatJson()
  %!python -m json.tool
endfunction
