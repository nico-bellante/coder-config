let mapleader = "\\"

" fzf config
nnoremap <leader><leader> :History<CR>
nmap <silent> <C-P> :GFiles<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>f :Rg<CR>
nnoremap <leader>p :Files<CR>
nmap <silent> <leader>h :History<CR>

" nerd tree config
nnoremap <leader>[ :NERDTreeFind<CR>
nnoremap <leader>] :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize=60


nmap <leader>p :Prettier<CR>


