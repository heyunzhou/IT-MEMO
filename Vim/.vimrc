call plug#begin('~/.vim/plugged')
" Add your plugins here
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'preservim/tagbar'
Plug 'machakann/vim-highlightedyank'
Plug 'easymotion/vim-easymotion'
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
