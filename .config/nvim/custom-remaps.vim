" Open terminal
nnoremap <Leader>` :split<CR>:resize 12<CR>:term<CR>i

" Substitute selected text
vnoremap * y:%s/\V<C-R>=escape(@",'/\:')<CR>//g<Left><Left>

" Clear hlsearch
nnoremap <Leader><Leader> :nohlsearch<CR>

" Close all buffers
nnoremap <Leader>bd :%bd<CR>

" Smart move between panes
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Hide whitespace
nnoremap <Leader>hl :set list!<CR>
