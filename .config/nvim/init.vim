" Download vim-plug
if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
  silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
         \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set relativenumber " Show the line number relative to the line with the cursor

set hidden " When off a buffer is unloaded when it is abandoned

set expandtab " Use the appropriate number of spaces to insert a <Tab>
set shiftwidth=2 softtabstop=2 " Number of spaces that a <Tab> counts for while performing editing operations

set autoindent " Copy indent from current line when starting a new line

set number " Precede each line with its line number

set nowrap " When on, lines longer than the width of the window will wrap and displaying continues on the next line

set ignorecase " If the 'ignorecase' option is on, the case of normal letters is ignored
set smartcase " Override the 'ignorecase' option if the search pattern contains upper case characters
set incsearch " While typing a search command, show where the pattern, as it was typed so far, matches

set noswapfile " Noswapfile modifier can be used to not create a swapfile for a new buffer
set nobackup " Do not make a backup before overwriting a file

set termguicolors " Enables 24-bit RGB color

set scrolloff=4 " Minimal number of screen lines to keep above and below the cursor

set shortmess+=c " This option helps to avoid all the hit-enter prompts caused by file messages

set mouse=ni " Enables mouse support

set cursorline " Highlight the screen line of the cursor with CursorLine

set list listchars=tab:→\ ,space:-,trail:~ " Display white characters

set signcolumn=yes " Add one extra column for validation feedback

set exrc " Load project's local vimrc config

set splitbelow splitright " Open new split below or right

let mapleader=' ' " Change leader key

call plug#begin(stdpath('data') . '/plugged')

Plug 'scrooloose/nerdtree'                          " File explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy file search
Plug 'junegunn/fzf.vim'                             " Fuzzy file search
Plug 'tpope/vim-fugitive'                           " Git wrapper
Plug 'vim-airline/vim-airline'                      " Pretty statusline
Plug 'vim-scripts/gitignore'                        " Set wildignore from gitignore
Plug 'neoclide/coc.nvim', { 'branch': 'release' }   " Autocomplete
Plug 'gruvbox-community/gruvbox'                    " Colorscheme
Plug 'maxmellon/vim-jsx-pretty'                     " JSX & TSX syntax
Plug 'andreshazard/vim-freemarker'                  " Syntax support for FTL
Plug 'tpope/vim-surround'                           " Quoting/parenthesizing made simple
Plug 'ap/vim-css-color'                             " CSS colors
Plug 'mattn/emmet-vim'                              " Emmet
Plug 'arcticicestudio/nord-vim'                     " Colorscheme

call plug#end()

" Escape from terminal (causes issues with fzf)
" tnoremap <ESC> <C-\><C-n>

nnoremap <Leader>` :split<CR>:resize 12<CR>:term<CR>i

" Substitute selected text
vnoremap * y:%s/\V<C-R>=escape(@",'/\:')<CR>//g<Left><Left>

" Clear hlsearch
nnoremap <Leader><Leader> :nohlsearch<CR>

" Close all buffers but current
nnoremap <Leader>bd :%bd<CR>

" Smart move between panes
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" GIT (Fugitive)
nnoremap <Leader>gs :tab G<CR>

" Color scheme
" let g:gruvbox_contrast_dark='hard'
let g:nord_uniform_diff_background=1
let g:nord_cursor_line_number_background=1

colorscheme nord

" Airline
let g:airline#extensions#tabline#enabled=0
let g:airline_powerline_fonts=0

" fzf
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }

nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>e :Buffers<CR>

" CoC
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gr <Plug>(coc-references)
nmap <Leader>rn <Plug>(coc-rename)
nmap <Leader>ac <Plug>(coc-codeaction)
nmap <Leader>o :CocCommand tsserver.organizeImports<CR>

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" NERDTree
let NERDTreeDirArrowExpandable="+"
let NERDTreeDirArrowCollapsible="~"

nnoremap <Leader>pv :NERDTreeToggle<CR>
nnoremap <Leader>pc :NERDTreeFind<CR>

" Custom
nnoremap <Leader>hl :set list!<CR>
