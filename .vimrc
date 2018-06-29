
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'tpope/vim-rhubarb'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
call plug#end()
map <C-f> :Files<CR>
map <C-d> :GFiles?<CR>
map <C-g> :GFiles<CR>
map <C-b> :Buffers<CR>

" Toggle Rainbow Levels
map <F5> :RainbowLevelsToggle<cr>

" NerdTree Toggle
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>
 
" :Rg (Source: https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2)
command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
command! -bang -nargs=* Rgrex call fzf#vim#grep('rg --column --line-number --no-heading --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

set grepprg=rg\ --vimgrep
set number
set expandtab
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start

if !has('nvim')
    set ttymouse=xterm2
endif
set mouse=a
set clipboard=unnamed
map <C-J> <C-W><C-J> "Ctrl-j to move down a split
map <C-K> <C-W><C-K> "Ctrl-k to move up a split
map <C-L> <C-W><C-L> "Ctrl-l to move    right a split
map <C-H> <C-W><C-H> "Ctrl-h to move left a split
