" fzf

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }

nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>e :Buffers<CR>
nnoremap <Leader>ff :Rg 
