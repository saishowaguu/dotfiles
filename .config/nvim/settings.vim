set relativenumber                         " Show the line number relative to the line with the cursor
set hidden                                 " When off a buffer is unloaded when it is abandoned
set expandtab                              " Use the appropriate number of spaces to insert a <Tab>
set shiftwidth=2 softtabstop=2             " Number of spaces that a <Tab> counts for while performing editing operations
set autoindent                             " Copy indent from current line when starting a new line
set number                                 " Precede each line with its line number
set nowrap                                 " When on, lines longer than the width of the window will wrap and displaying continues on the next line
set ignorecase                             " If the 'ignorecase' option is on, the case of normal letters is ignored
set smartcase                              " Override the 'ignorecase' option if the search pattern contains upper case characters
set incsearch                              " While typing a search command, show where the pattern, as it was typed so far, matches
set noswapfile                             " Noswapfile modifier can be used to not create a swapfile for a new buffer
set nobackup                               " Do not make a backup before overwriting a file
set termguicolors                          " Enables 24-bit RGB color
set scrolloff=4                            " Minimal number of screen lines to keep above and below the cursor
set shortmess+=c                           " This option helps to avoid all the hit-enter prompts caused by file messages
set mouse=ni                               " Enables mouse support
set cursorline                             " Highlight the screen line of the cursor with CursorLine
set list listchars=tab:→\ ,space:-,trail:~ " Display white characters
set signcolumn=yes                         " Add one extra column for validation feedback
set exrc                                   " Load project's local vimrc config
set splitbelow splitright                  " Open new split below or right

let mapleader=' '                          " Change leader key
