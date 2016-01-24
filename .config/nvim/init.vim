source ~/.vimrc

" Create terminals
map <leader>ts <C-w>n:terminal<CR>
map <leader>tv <C-w>v:terminal<CR>
map <leader>tt :tabnew\|terminal<CR>

" Terminal Mappings

" Escape terminal with <Esc> SO MUCH EASIER!
tnoremap <Esc> <C-\><C-n>

" Window nav in terminal
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" Auto Reload .vimrc on change
" Added because the one in the vimrc works on nvimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost ~/.vimrc source $MYVIMRC
augroup END " }

" Weird nvim quirk fix
"nnoremap <BS> <C-w>h
