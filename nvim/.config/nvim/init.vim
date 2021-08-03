let g:mapleader=' '

set clipboard+=unnamedplus
set completeopt=menuone,noselect
set expandtab
set hidden
set nohlsearch
set ignorecase
set list listchars=tab:\ ,trail:~,space:-
set mouse=a
set nowrap
set number
set relativenumber
set shiftwidth=2
set signcolumn=yes
set smartcase
set tabstop=2
set termguicolors

if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
  silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin(stdpath('data') . '/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'hoob3rt/lualine.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'navarasu/onedark.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

lua require('lualine').setup({ options = { theme = 'onedark', section_separators = '', component_separators = '' }})

lua require('nvim-treesitter.configs').setup { highlight = { enable = true } }

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

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"
inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <leader>bd :bd<cr>
nnoremap <leader>bD :%bd<cr>
