call plug#begin('~/.config/nvim')

Plug 'itchyny/lightline.vim'
Plug 'drewtempelmeyer/palenight.vim'

Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
    \ 'coc-python',
    \ 'coc-rust-analyzer',
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

" Custom mappings
inoremap jj <Esc>
nnoremap <silent> <C-f> :Files<CR>

" Theme settings
syntax enable
set background=dark
colorscheme palenight

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif
