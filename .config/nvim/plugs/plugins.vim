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
" Plug 'jiangmiao/auto-pairs'                         " Auto close brackets
Plug 'stsewd/fzf-checkout.vim'                      " Checkout branches with fzf
Plug 'OmniSharp/omnisharp-vim'                      " Dotnet support
" Plug 'gruvbox-community/gruvbox'                    " Colorscheme

call plug#end()
