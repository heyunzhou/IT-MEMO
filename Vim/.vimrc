call plug#begin('~/.vim/plugged')
" Add your plugins here
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar', {'on': 'TagbarToggle'}
Plug 'machakann/vim-highlightedyank'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi'
Plug 'frazrepo/vim-rainbow'
call plug#end()

let mapleader = " "
map <leader>e :NERDTreeToggle<CR>

let g:tagbar_autofocus = 1
map <F8> :TagbarToggle<CR>

let g:highlightedyank_highlight_duration = 300

map f <Plug>(easymotion-bd-f)


set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=4
set cursorline
set wrap
set scrolloff=5
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set clipboard=unnamed

"Cursor Setting
let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[3 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL  mode

"==================================================
" Key Mapping
"==================================================
map <C-A> ggVG
map <C-H> <C-W>h
map <C-L> <C-W>l
map H ^
map L $
map J 5j
map K 5k

imap jj <ESC>
imap <C-K> <C-O>d$

nmap <leader>p "0p
nmap <A-p> vwgr
nmap <C-p> Vgr
nmap vv <C-v>

nmap vw viw
nmap yw yiw
nmap cw ciw
nmap dw diw

nmap vb vib
nmap yb yib
nmap cb cib
nmap db dib

nmap vB viBV
nmap yB viBVy
nmap cB ciB
nmap dB diB

nmap v" vi"
nmap y" yi"
nmap c" ci"
nmap d" di"

nmap v' vi'
nmap y' yi'
nmap c' ci'
nmap d' di'

nmap n nzz
nmap N Nzz

nmap Y y$
nmap > >>
nmap < <<
vmap > >gv
vmap < <gv

map nh :nohl<CR>
nmap <leader>j V:m '>+1<CR>gv=gv
nmap <leader>k V:m '>-2<CR>gv=gv
vmap <leader>j :m '>+1<CR>gv=gv
vmap <leader>k :m '>-2<CR>gv=gv

