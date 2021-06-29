set showmatch
set ignorecase
set mouse=v
set hlsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number
set wildmode=longest,list
set cc=80
filetype plugin indent on
syntax on

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
set notermguicolors

call plug#begin('~/.local/share/nvim/plugged')

    Plug 'davidhalter/jedi-vim'
    Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
    Plug 'schee/deoplete-jedi'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'jiangmiao/auto-pairs'
    "    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'tmhedberg/SimplyFold'
    
    let g:airline_theme='luna'
    let g:deoplete#enable_at_startup = 1

call plug#end()
