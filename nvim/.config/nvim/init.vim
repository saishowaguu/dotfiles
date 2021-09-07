let g:mapleader=' '

set clipboard+=unnamedplus
set completeopt=menuone,noselect
set cursorline
set expandtab
set hidden
set nohlsearch
set ignorecase
set list listchars=tab:>>,trail:~,space:-
set mouse=a
set nowrap
set number
set relativenumber
set shiftwidth=2
set signcolumn=yes
set smartcase
set splitbelow
set splitright
set tabstop=2
set termguicolors

if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
  silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin(stdpath('data') . '/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'arcticicestudio/nord-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'

call plug#end()

let g:nord_cursor_line_number_background = 1
let g:nord_uniform_diff_background = 1

colorscheme nord

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']

let g:nvim_tree_icons = {
      \ 'git': {
        \ 'ignored': '~',
        \ 'unstaged': 'x',
        \ 'untracked': '*'
        \ },
      \ 'folder': {
        \ 'arrow_open': '-',
        \ 'arrow_closed': '+',
        \ 'default': '[ ]',
        \ 'open': '[+]',
        \ 'empty': '[x]'
        \ }
      \ }

lua require('nvim-treesitter.configs').setup({ highlight = { enable = true }})

nnoremap <leader>g :tab G<cr>

vnoremap < <gv
vnoremap > >gv

nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <c-n> :NvimTreeToggle<cr>
nnoremap <leader>n :NvimTreeFindFile<cr>

nnoremap <c-p> :GFiles<cr>
nnoremap <leader>e :Buffers<cr>
nnoremap <leader>f :Files<cr>

nnoremap <leader>bd :bd<cr>
nnoremap <leader>bD :%bd<cr>
nnoremap <leader>bf :Neoformat<cr>

nnoremap <leader>m :e $MYVIMRC<cr>

nnoremap <leader>t :split<cr>:resize 12<cr>:term<cr>

vnoremap <leader>d y'>p

autocmd BufWritePre *.js,*.json Neoformat
