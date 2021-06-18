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

au! BufWritePost $MYVIMRC source %         " Auto source when writing init.vim

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

Plug 'scrooloose/nerdtree'                          " File explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy file search
Plug 'junegunn/fzf.vim'                             " Fuzzy file search
Plug 'tpope/vim-fugitive'                           " Git wrapper
Plug 'vim-airline/vim-airline'                      " Pretty statusline
Plug 'neoclide/coc.nvim', { 'branch': 'release' }   " Autocomplete
Plug 'maxmellon/vim-jsx-pretty'                     " JSX & TSX syntax
Plug 'andreshazard/vim-freemarker'                  " Syntax support for FTL
Plug 'tpope/vim-surround'                           " Quoting/parenthesizing made simple
Plug 'mattn/emmet-vim'                              " Emmet
Plug 'arcticicestudio/nord-vim'                     " Colorscheme
Plug 'airblade/vim-gitgutter'                       " Shows a git diff in the sign column
Plug 'ryanoasis/vim-devicons'                       " Devicons
Plug 'easymotion/vim-easymotion'                    " Code navigation made easy
Plug 'jiangmiao/auto-pairs'                         " Auto close brackets
Plug 'stsewd/fzf-checkout.vim'                      " Checkout branches with fzf
Plug 'OmniSharp/omnisharp-vim'                      " Dotnet support

call plug#end()

" =============================================================================
" KEYMAPS
" =============================================================================

" Open terminal
nnoremap <Leader>` :split<CR>:resize 11<CR>:term<CR>i

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

" Hide whitespace
nnoremap <Leader>sl :set list!<CR>

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

" =============================================================================
" PLUGIN SPECIFIC
" =============================================================================

" Airline
" -----------------------------------------------------------------------------

let g:airline#extensions#tabline#enabled=0 " Hide tabline
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

colorscheme nord
