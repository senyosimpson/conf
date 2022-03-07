call plug#begin('~/.config/nvim')

Plug 'itchyny/lightline.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/sonokai'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

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
    \ 'coc-markdownlint',
    \ 'coc-elixir',
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
set cmdheight=2
set signcolumn=yes
set mouse=a
set nobackup
set writebackup
set spelllang=en_gb
set splitbelow

" Auto commands
autocmd BufReadPre *.py :set foldmethod=indent
autocmd VimEnter *.json :set shiftwidth=2
autocmd VimEnter *.tf :set shiftwidth=2
autocmd InsertLeave * :w
autocmd VimEnter * :RainbowParentheses
autocmd CursorHold * silent call CocActionAsync('highlight')

" Go to normal mode from insert mode
inoremap jj <Esc>
" Go the end of the line
nnoremap 9 $
" Open terminal
nnoremap <C-1> :term<CR>
" Go back to normal mode in the terminal
tnoremap <C-e> <C-\><C-n>
" Fuzzy finder and Rg
nnoremap <silent> ff :Files<CR>
nnoremap <silent> rr :Rg<CR>
" Go to previously opened buffer
nnoremap <silent> ,, <C-^>
" This unsets the last searched pattern register by hitting return
nnoremap <silent> <CR> :noh<CR><CR>
" Toggle file explorer in normal and insert mode
nnoremap <C-e> :Lexplore<CR>
" GoTo code definitions using CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Jump further on up and down keys
nnoremap <silent> <Up> 5k
nnoremap <silent> <Down> 5j
nnoremap <silent> <Left> 5h
nnoremap <silent> <Right> 5l


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" Theme settings
syntax enable
colorscheme sonokai
let g:sonokai_style = 'andromeda'

" Netrw config

" Setting up Python for Neovim. This is in order to ensure that the Python
" used by Neovim always has some standard tools in it such as Black
" Instructions from the guide: https://neovim.io/doc/user/provider.html
"
" pyenv install 3.4.4
" pyenv virtualenv 3.4.4 py3nvim
" pyenv activate py3nvim
" pip install pynvim black pylint
" pyenv which python  # Note the path
"
" The last command reports the interpreter path, add it to your init.vim:
let g:python3_host_prog = '/home/senyeezus/.pyenv/versions/py3nvim/bin/python'

