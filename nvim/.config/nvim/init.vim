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
Plug 'hrsh7th/nvim-compe'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

call plug#end()

colorscheme gruvbox

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=0

let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']

let g:nvim_tree_icons = {
      \ 'folder': {
        \ 'arrow_open': '-',
        \ 'arrow_closed': '+'
        \}
      \ }

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true

lua require('nvim-treesitter.configs').setup({ highlight = { enable = true }})

lua <<EOF
require('lspconfig').tsserver.setup({
  commands = {
    OrganizeImports = {
      function()
        local params = {
          command = "_typescript.organizeImports",
          arguments = {vim.api.nvim_buf_get_name(0)},
          title = ""
        }

        vim.lsp.buf.execute_command(params)
      end,
      description = "Organize imports"
    }
  }
})
EOF

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

nnoremap <c-p> :GFiles<cr>
nnoremap <leader>e :Buffers<cr>
nnoremap <leader>f :Files<cr>

nnoremap <leader>bd :bd<cr>
nnoremap <leader>bD :%bd<cr>
nnoremap <leader>bf :Neoformat<cr>

nnoremap <leader>m :e $MYVIMRC<cr>

nnoremap <leader>t :split<cr>:resize 12<cr>:term<cr>

inoremap <silent><expr> <c-space> compe#complete()
inoremap <silent><expr> <cr>      compe#confirm('<cr>')
inoremap <silent><expr> <c-e>     compe#close('<c-e>')
inoremap <silent><expr> <c-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <c-d>     compe#scroll({ 'delta': -4 })

nnoremap <leader>o :OrganizeImports<cr>

autocmd BufWritePre *.js,*.json Neoformat
