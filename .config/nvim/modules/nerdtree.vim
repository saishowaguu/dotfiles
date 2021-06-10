let NERDTreeDirArrowExpandable="+"  " Icon for collapsed folder
let NERDTreeDirArrowCollapsible="~" " Icon for expanded folder
let NERDTreeNaturalSort=1           " Natural sorting, like 1, 2, ..., 11, 12, ..., 21, 22

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
