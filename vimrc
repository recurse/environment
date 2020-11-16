syntax on
filetype plugin indent on

set nocompatible
set number
set nowrap
set showmode
set tw=120
set smartcase
set smarttab
set smartindent
set autoindent
set softtabstop=4
set shiftwidth=4
set expandtab
set incsearch
set mouse=a
set history=1000
set clipboard=unnamed,autoselect
set wrap

set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set t_Co=256

set cmdheight=1

vnoremap <C-c> :w !pbcopy

execute pathogen#infect()

" solarized
set gfn=monaco
set anti
set background=dark
colorscheme solarized

" ctrl-p
map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

" daml support
augroup filetypedetect
    au BufRead,BufNewFile *.daml setfiletype haskell
augroup END
