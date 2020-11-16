call plug#begin('~/.config/nvim')
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Lightline configuration
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }

let g:coc_global_extensions = [
    \ 'coc-python',
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
