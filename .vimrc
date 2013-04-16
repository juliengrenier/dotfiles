"Essential
set nocompatible 
filetype plugin indent on

set listchars=extends:>,precedes:<,eol:$,trail:.,tab:>-

"Indentation
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"Search
set incsearch
set hlsearch
set ignorecase
set smartcase

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

"encoding
set encoding=utf8

"key mapping
let mapleader = ","
noremap \ ,
nmap <silent> <leader>a 1GVG
nmap <silent> <leader>l :set list!<CR>
nmap <silent> <leader>n :silent :nohlsearch<CR>
nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>c :set number!<CR>
nmap <silent> <leader>o yiW :vsp <C-r>0<CR>
nmap <silent> <leader>w :set diffopt+=iwhite<CR>
nmap <silent> <leader>W :set diffopt-=iwhite<CR>
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
