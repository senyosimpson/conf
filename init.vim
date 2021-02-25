call plug#begin('~/.config/nvim')

Plug 'itchyny/lightline.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

call plug#end()

" Lightline configuration
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }

let g:coc_global_extensions = [
    \ 'coc-pyright',
    \ 'coc-git',
    \ 'coc-rust-analyzer',
    \ 'coc-json',
    \ ]

" Vim config
set cursorline
set expandtab
set hidden
set number
set noshowmode
set relativenumber
set shiftwidth=4
set tabstop=4
set updatetime=100

" Auto commands
" autocmd BufWritePre *.py execute ':Black'
autocmd BufReadPre *.py :set foldmethod=indent

" Custom mappings
inoremap jj <Esc>
nnoremap <silent> <C-f> :Files<CR>

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" Theme settings
syntax enable
" set background=dark
colorscheme sonokai
let g:sonokai_style = 'andromeda'
