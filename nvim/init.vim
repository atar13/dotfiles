" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'


call plug#end()

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

inoremap jk <ESC>

set smartindent
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set tabstop=4


:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

let mapleader = " "

" Toggles nerdtree file manager
nnoremap <leader>z :NERDTreeToggle <CR> 

" Clears text selection when searching
nnoremap <leader>/ :noh <CR>

nnoremap <leader>l <C-w>l <CR>
nnoremap <leader>h <C-w>h <CR>
