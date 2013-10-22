"Essential
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Syntastic'
Bundle 'https://github.com/tpope/vim-fugitive'
Bundle 'https://github.com/rizzatti/funcoo.vim.git'
Bundle 'https://github.com/rizzatti/dash.vim'
Bundle 'https://github.com/majutsushi/tagbar'
"Bundle 'git://repo.or.cz/vcscommand'
Bundle 'https://github.com/bling/vim-airline'
Bundle 'https://github.com/tpope/vim-markdown.git'
Bundle 'https://github.com/mhinz/vim-signify'
if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages "
  echo ""
  :BundleInstall
endif

set nocompatible
filetype plugin indent on
set background=dark
set scrolloff=2
set listchars=extends:>,precedes:<,eol:$,trail:.,tab:>-

let g:airline_powerline_fonts = 1
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

colorscheme torte
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
nmap <silent> <leader>a 1GVG
nmap <silent> <leader>l :set list!<CR>
nmap <silent> <leader>n :silent :nohlsearch<CR>
nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>p :bp<CR>
nmap <silent> <leader>tt :TagbarToggle<CR>
nmap <silent> <leader>h :set number!<CR>
nmap <silent> <leader>oe yiW :e <C-r>0<CR>
nmap <silent> <leader>os yiW :sp <C-r>0<CR>
nmap <silent> <leader>ov yiW :vsp <C-r>0<CR>
nmap <silent> <leader>w :set diffopt+=iwhite<CR>
nmap <silent> <leader>W :set diffopt-=iwhite<CR>
nmap <silent> <leader>K <ESC>i<CR><ESC>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

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
autocmd BufRead *.py nmap <buffer> <silent> <leader>/ I#<ESC>j
autocmd BufRead *.py xnoremap <buffer> <silent> <leader>pdb i__import__('pdb').set_trace()<ESC>==j
autocmd BufRead *.py nmap <buffer> <F5> :!python %<CR>
autocmd BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4

