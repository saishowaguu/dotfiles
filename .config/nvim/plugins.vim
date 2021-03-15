call plug#begin(stdpath('data') . '/plugged')

Plug 'scrooloose/nerdtree'                          " File explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy file search
Plug 'junegunn/fzf.vim'                             " Fuzzy file search
Plug 'tpope/vim-fugitive'                           " Git wrapper
Plug 'vim-airline/vim-airline'                      " Pretty statusline
Plug 'vim-scripts/gitignore'                        " Set wildignore from gitignore
Plug 'neoclide/coc.nvim', { 'branch': 'release' }   " Autocomplete
Plug 'maxmellon/vim-jsx-pretty'                     " JSX & TSX syntax
Plug 'andreshazard/vim-freemarker'                  " Syntax support for FTL
Plug 'tpope/vim-surround'                           " Quoting/parenthesizing made simple
Plug 'mattn/emmet-vim'                              " Emmet
Plug 'arcticicestudio/nord-vim'                     " Colorscheme

call plug#end()
