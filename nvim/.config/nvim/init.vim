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
set mouse=a                                " Enables mouse support
set cursorline                             " Highlight the screen line of the cursor with CursorLine
set list listchars=tab:→\ ,trail:~ " Display white characters
set signcolumn=yes                         " Add one extra column for validation feedback
set splitbelow                             " Horizontal splits will automatically be below
set splitright                             " Vertical splits will automatically be to the right
set inccommand=nosplit                     " Show substitution results as you type
set completeopt=menuone,noselect           " Required by compe
set clipboard=unnamedplus                  " Use system clipboard
set nohlsearch                             " Do not hightlight search occurrences

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

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }             " Fuzzy file search
Plug 'junegunn/fzf.vim'                                         " Fuzzy file search
Plug 'tpope/vim-fugitive'                                       " Git wrapper
Plug 'neoclide/coc.nvim', { 'branch': 'release' }               " Autocomplete
Plug 'maxmellon/vim-jsx-pretty'                                 " JSX & TSX syntax
" Plug 'andreshazard/vim-freemarker'                              " Syntax support for FTL
Plug 'tpope/vim-surround'                                       " Quoting/parenthesizing made simple
Plug 'mattn/emmet-vim'                                          " Emmet
Plug 'sainnhe/edge'                                             " Colorscheme
Plug 'airblade/vim-gitgutter'                                   " Shows a git diff in the sign column
Plug 'jiangmiao/auto-pairs'                                     " Auto close brackets
Plug 'stsewd/fzf-checkout.vim'                                  " Checkout branches with fzf
Plug 'OmniSharp/omnisharp-vim'                                  " Dotnet support
Plug 'dense-analysis/ale'                                       " Syntax checking for c#
Plug 'vimwiki/vimwiki'                                          " Vim wiki
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                  " Coloured devicons
Plug 'kyazdani42/nvim-web-devicons'                             " Devicons for nvimtree
Plug 'kyazdani42/nvim-tree.lua'                                 " Project explorer
Plug 'hoob3rt/lualine.nvim'                                     " Statusline
Plug 'phaazon/hop.nvim'                                         " Easy motion

call plug#end()

" Open terminal
nnoremap <Leader>t :split<CR>:resize 12<CR>:term<CR>

" Easy change panes
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k

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
nnoremap <Leader>l :set list!<CR>

" Quickfix list jump
nnoremap <Leader>] :cnext<CR>
nnoremap <Leader>[ :cprev<CR>

" Open git (vim-fugitive) in new tab
nnoremap <Leader>g :tab G<CR>

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
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <Leader>n :NvimTreeFind<CR>

" Hop
nnoremap <Leader>h :HopWord<CR>

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

" fzf

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } } " Make fzf window 95% of width and height
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']          " Preview window hidden by default

" Colorscheme
colorscheme edge

" Lualine
lua << EOF
require('lualine').setup()
EOF

" Hop
lua << EOF
require('hop').setup()
EOF
