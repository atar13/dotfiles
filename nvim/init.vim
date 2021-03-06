" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree' |
			\ Plug 'Xuyuanp/nerdtree-git-plugin' |
			\ Plug 'ryanoasis/vim-devicons'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'bluz71/vim-moonfly-colors'
Plug 'bignimbus/pop-punk.vim'
Plug 'tpope/vim-commentary'
Plug 'APZelos/blamer.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'sakshamgupta05/vim-todo-highlight'
Plug 'tpope/vim-fugitive'

call plug#end()

" use space as the leader character
let mapleader = " "

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
" set tabstop=4

colorscheme	pop-punk
let g:terminal_ansi_colors = pop_punk#AnsiColors()
let g:airline_theme = 'pop_punk'
let g:airline_section_c = '🌋🦛 %F'

let g:airline_powerline_fonts = 1

" Git blame config
let g:blamer_enabled = 1
nnoremap <leader>b :BlamerToggle <CR>
let g:blamer_date_format = '%m/%d/%y %H:%M'

" git gutter line highlight 
"GitGutterLineNrHighlightsEnable .
let g:airline#extensions#hunks#enabled=1

:set number relativenumber

" Force Ack plugin to use ag to search
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" set line numering to change based on current mode
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END


" Toggles nerdtree file manager
nnoremap <leader>z :NERDTreeToggle % <CR> 

" Clears text selection when searching
nnoremap <leader>/ :noh <CR>

" Ack search
nnoremap <leader>f :Ack

" Switch split screen vim tabs
nnoremap <leader>l <C-w>l <CR>
nnoremap <leader>h <C-w>h <CR>

" System clipboard copy in visual mode
vnoremap ;; "+y <CR>
" System clipboard paste in normal mode
nnoremap ;; "+p <CR>


vnoremap < <gv
vnoremap > >gv

" nnoremap <C-`> :sp | te <CR>


" Set custom comment characters for different file types
" autocmd FileType apache setlocal commentstring=#\ %s
autocmd FileType c setlocal commentstring=//\ %s

