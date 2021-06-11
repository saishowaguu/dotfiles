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
