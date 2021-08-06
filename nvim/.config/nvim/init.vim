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
Plug 'gruvbox-community/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'prettier/vim-prettier', {'do': 'npm install'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

colorscheme gruvbox

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=0

let g:prettier#autoformat_require_pragma=0
let g:prettier#autoformat_config_present=1

lua require('nvim-treesitter.configs').setup({ highlight = { enable = true }})

lua <<EOF
require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
    file_sorter = require('telescope.sorters').get_fzy_sorter
  },
  pickers = {
    buffers = {
      sort_lastused = true
    }
  }
})
EOF

lua require('lspconfig').tsserver.setup({})
lua require('lspconfig').clangd.setup({})

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

nnoremap <c-p> :Telescope git_files<cr>
nnoremap <leader>e :Telescope buffers<cr>
nnoremap <leader>f :Telescope find_files<cr>

nnoremap <leader>bd :bd<cr>
nnoremap <leader>bD :%bd<cr>

nnoremap <leader>m :e $MYVIMRC<cr>

nnoremap <leader>t :split<cr>:resize 12<cr>:term<cr>
