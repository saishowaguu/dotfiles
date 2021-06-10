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
nnoremap <Leader>p :GFiles<CR>
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
