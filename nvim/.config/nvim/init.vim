" =============================================================================
" SETTINGS
" =============================================================================

let g:mapleader="\<Space>"                 " Change leader key

set relativenumber                         " Show the line number relative to the line with the cursor
set hidden                                 " When off a buffer is unloaded when it is abandoned
set shiftwidth=2                           " Number of space characters inserted for indentation
set tabstop=2                              " Insert 2 spaces for a tab
set expandtab                              " Use the appropriate number of spaces to insert a <Tab>
set autoindent                             " Copy indent from current line when starting a new line
set smartindent                            " Makes indenting smart
set number                                 " Precede each line with its line number
set nowrap                                 " Do not wrap long lines
set ignorecase                             " If the 'ignorecase' option is on, the case of normal letters is ignored
set smartcase                              " Override the 'ignorecase' option if the search pattern contains upper case characters
set incsearch                              " While typing a search command, show where the pattern, as it was typed so far, matches
set noswapfile                             " Noswapfile modifier can be used to not create a swapfile for a new buffer
set nobackup                               " Do not make a backup before overwriting a file
set termguicolors                          " Enables 24-bit RGB color
set scrolloff=2                            " Minimal number of screen lines to keep above and below the cursor
set shortmess+=c                           " This option helps to avoid all the hit-enter prompts caused by file messages
set mouse=a                                " Enables mouse support
set cursorline                             " Highlight the screen line of the cursor with CursorLine
set list listchars=tab:→\ ,space:-,trail:~ " Display white characters
set signcolumn=yes                         " Add one extra column for validation feedback
set exrc                                   " Load project's local vimrc config
set splitbelow                             " Horizontal splits will automatically be below
set splitright                             " Vertical splits will automatically be to the right
set inccommand=nosplit                     " Show substitution results as you type
set colorcolumn=80                         " Show ruler at 80 char
set t_Co=256                               " Support 256 colors
set updatetime=300                         " Faster completion
set timeoutlen=500                         " By default it's 1000
set formatoptions-=cro                     " Stop newline continution of comments
set noshowmode                             " Do not display mode in command line
set completeopt=menuone,noselect           " Required by compe

" Sudo write RO files
cmap w!! w !sudo tee %

" =============================================================================
" PLUGINS
" =============================================================================

" Download vim-plug automatically
if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
  silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

Plug 'scrooloose/nerdtree'                                      " File explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }             " Fuzzy file search
Plug 'junegunn/fzf.vim'                                         " Fuzzy file search
Plug 'tpope/vim-fugitive'                                       " Git wrapper
Plug 'vim-airline/vim-airline'                                  " Pretty statusline
Plug 'neoclide/coc.nvim', { 'branch': 'release' }               " Autocomplete
Plug 'maxmellon/vim-jsx-pretty'                                 " JSX & TSX syntax
" Plug 'andreshazard/vim-freemarker'                              " Syntax support for FTL
Plug 'tpope/vim-surround'                                       " Quoting/parenthesizing made simple
Plug 'mattn/emmet-vim'                                          " Emmet
Plug 'arcticicestudio/nord-vim'                                 " Colorscheme
Plug 'airblade/vim-gitgutter'                                   " Shows a git diff in the sign column
Plug 'ryanoasis/vim-devicons'                                   " Devicons
Plug 'easymotion/vim-easymotion'                                " Code navigation made easy
Plug 'jiangmiao/auto-pairs'                                     " Auto close brackets
Plug 'stsewd/fzf-checkout.vim'                                  " Checkout branches with fzf
Plug 'OmniSharp/omnisharp-vim'                                  " Dotnet support
Plug 'dense-analysis/ale'                                       " Syntax checking for c#
" Plug 'neovim/nvim-lspconfig'                                    " Build-in LSP
" Plug 'kabouzeid/nvim-lspinstall'                                " Auto install LSP
" Plug 'hrsh7th/nvim-compe'                                       " Autocomplete
" Plug 'nvim-lua/popup.nvim'                                      " Fuzzy file search
" Plug 'nvim-lua/plenary.nvim'                                    " Fuzzy file search
" Plug 'nvim-telescope/telescope.nvim'                            " Fuzzy file search
" Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }   " Code hightlighting
" Plug 'sainnhe/sonokai'                                          " treesitter compatible colorscheme
Plug 'vimwiki/vimwiki'                                          " Vim wiki
" Plug 'prettier/vim-prettier', { 'do': 'npm install' }           " Prettier
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                  " Coloured devicons

call plug#end()

" =============================================================================
" KEYMAPS
" =============================================================================

" Open terminal
nnoremap <Leader>`h :split<CR>:resize 12<CR>:term<CR>
nnoremap <Leader>`v :vsplit<CR>:term<CR>

" Easy change panes
tnoremap <C-k> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l

" Auto insert terminal
" autocmd BufWinEnter,WinEnter term://* startinsert

" Substitute selected text
vnoremap <Leader>* y:%s/\V<C-R>=escape(@",'/\:')<CR>//g<Left><Left>

" Close buffers
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bD :%bd<CR>

" Smart move between panes
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Toggle whitespace
nnoremap <Leader>ws :set list!<CR>

" Quickfix list jump
nnoremap <Leader>] :cnext<CR>
nnoremap <Leader>[ :cprev<CR>

" Open git (vim-fugitive) in new tab
nnoremap <Leader>gs :tab G<CR>

" Open fzf with git files/all files/buffers
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>e :Buffers<CR>

" CoC
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gr <Plug>(coc-references)
nmap <Leader>rn <Plug>(coc-rename)
nmap <Leader>ac <Plug>(coc-codeaction)
nmap <Leader>o :CocCommand tsserver.organizeImports<CR>

" Refresh popup window with c-space
inoremap <silent><expr> <C-Space> coc#refresh()

" Auto select first option when pressing enter
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle file explorer and select current file
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>

" Compile and run dotnet core project
nnoremap <Leader>9 :tabnew<CR>:term<CR>idotnet run<CR>

" Use alt + hjkl to resize windows
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better ^ and $ keys
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)

  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)

  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)

  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)

  autocmd BufWritePre *.cs :OmniSharpCodeFormat
augroup END

" =============================================================================
" PLUGIN SPECIFIC
" =============================================================================

" Airline
" -----------------------------------------------------------------------------

let g:airline#extensions#tabline#enabled=1 " Show tabline
let g:airline_powerline_fonts=1            " Enable powerline

" fzf
" -----------------------------------------------------------------------------

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } } " Make fzf window 95% of width and height
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']          " Preview window hidden by default

" NERDTree
" -----------------------------------------------------------------------------

let NERDTreeDirArrowExpandable="+"  " Icon for collapsed folder
let NERDTreeDirArrowCollapsible="~" " Icon for expanded folder
let NERDTreeNaturalSort=1           " Natural sorting, like 1, 2, ..., 11, 12, ..., 21, 22

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Nord colorscheme
" -----------------------------------------------------------------------------

let g:nord_uniform_diff_background=1       " Transparent background when viewing diff
let g:nord_cursor_line_number_background=1 " Add background color to active line number

" let g:ariline_theme = 'sonokai'
" let g:sonokai_style = 'maia'
" let g:sonokai_enable_italic = 0
" let g:sonokai_disable_italic_comment = 1

colorscheme nord

" Prettier
" -----------------------------------------------------------------------------

" let g:prettier#autoformat_config_present = 1
" let g:prettier#autoformat_require_pragma = 0
" let g:prettier#config#config_precedence = 'prefer-file'

" LSP config
" -----------------------------------------------------------------------------

lua << EOF
-- require'lspconfig'.tsserver.setup {}
-- require'nvim-treesitter.configs'.setup {
--   highlight = {
--     enable = true
--   }
-- }

-- local nvim_lsp = require('lspconfig')
-- 
-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
-- 
--   -- Enable completion triggered by <c-x><c-o>
--   -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- 
--   -- Mappings.
--   local opts = { noremap=true, silent=true }
-- 
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--   buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--   -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--   -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
--   -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- 
--   -- local function organize_imports()
--   --   local params = {
--   --     command = "_typescript.organizeImports",
--   --     arguments = { vim.api.nvim_buf_get_name(0) },
--   --     title = ""
--   --   }
--   --   vim.lsp.buf.execute_command(params)
--   -- end
-- 
--   buf_set_keymap('n', '<space>o', '<cmd>lua vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.api.nvim_buf_get_name(0) }, title = "" })<CR>', opts)
-- end
-- 
-- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches
-- -- local servers = { "pyright", "rust_analyzer", "tsserver" }
-- -- for _, lsp in ipairs(servers) do
-- --   nvim_lsp[lsp].setup { on_attach = on_attach }
-- -- end
-- 
-- require'lspinstall'.setup() -- important
-- 
-- local servers = require'lspinstall'.installed_servers()
-- for _, server in pairs(servers) do
--   require'lspconfig'[server].setup{ on_attach = on_attach }
-- end
-- 
-- require'compe'.setup {
--   enabled = true;
--   autocomplete = true;
--   debug = false;
--   min_length = 1;
--   preselect = 'enable';
--   throttle_time = 80;
--   source_timeout = 200;
--   resolve_timeout = 800;
--   incomplete_delay = 400;
--   max_abbr_width = 100;
--   max_kind_width = 100;
--   max_menu_width = 100;
--   documentation = true;
-- 
--   source = {
--     path = true;
--     buffer = true;
--     calc = false;
--     nvim_lsp = true;
--     nvim_lua = true;
--     vsnip = false;
--     ultisnips = false;
--   };
-- }

EOF
