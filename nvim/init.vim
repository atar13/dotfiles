"" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree' |
			\ Plug 'Xuyuanp/nerdtree-git-plugin' |
			\ Plug 'ryanoasis/vim-devicons'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bignimbus/pop-punk.vim'
Plug 'tpope/vim-commentary'
Plug 'APZelos/blamer.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'sakshamgupta05/vim-todo-highlight'
Plug 'tpope/vim-fugitive'
Plug 'akinsho/toggleterm.nvim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-surround'

" Plug 'kjssad/quantum.vim'
Plug 'liuchengxu/space-vim-theme'

Plug 'lervag/vimtex'
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()

" use space as the leader character
let mapleader = " "

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Closes vim if NERDTree is the last open tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

inoremap jk <ESC>

set smartindent
" set nowrap
set wrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set hidden
" set tabstop=4

" Disables theme background color to use terminal's
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
" colorscheme material

" let g:material_theme_style = 'darker'

if (has('termguicolors'))
  set termguicolors
endif

" set background=dark

" colorscheme quantum


colorscheme space_vim_theme

" hi Normal ctermbg=none

syntax enable

let g:terminal_ansi_colors = pop_punk#AnsiColors()
let g:airline_theme = 'pop_punk'
" let g:airline_theme = 'quantum'
let g:airline_section_c = '🌋 🌊 🦛 %F'
let g:airline_powerline_fonts = 1
let g:airline_section_y = ''
let g:airline_section_z = ''

" Git blame config
let g:blamer_enabled = 1
nnoremap <leader>b :BlamerToggle <CR>
let g:blamer_date_format = '%m/%d/%y %H:%M'

" git gutter line highlight 
"GitGutterLineNrHighlightsEnable .
let g:airline#extensions#hunks#enabled=1
" <leader>hp to preview hunk changes
let g:gitgutter_preview_win_floating = 1


" Force Ack plugin to use ag to search
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" set line numering to change based on current mode
set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END


" Toggles nerdtree file manager
nnoremap <leader>z :NERDTreeToggle % <CR> 
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$', '\.git$']

" Clears text selection when searching
nnoremap <leader>c :noh <CR>

" Ack search
nnoremap <leader>f :Ack

" Prettier formatting
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>i  <Plug>(coc-format-selected)
nmap <leader>i  <Plug>(coc-format-selected)

" Switch split screen vim tabs
nnoremap <leader>l <C-w>l <CR>
nnoremap <leader>h <C-w>h <CR>
nnoremap <leader>j <C-w>j <CR>
nnoremap <leader>k <C-w>k <CR>

" set clipboard+=unnamedplus
set clipboard^=unnamed,unnamedplus
" System clipboard copy in visual mode
" vnoremap <leader>;; "+y <CR>
" nnoremap <leader>;; "+y <CR>
" System clipboard paste in normal mode
" nnoremap <leader>p "+p <CR>
nnoremap x "_x
vnoremap x "_x


" Indentation binds
vnoremap < <gv
vnoremap > >gv


" Set custom comment characters for different file types
autocmd FileType apache setlocal commentstring=#\ %s
autocmd FileType c setlocal commentstring=//\ %s

autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><leader>n <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><leader>n <Cmd>exe v:count1 . "ToggleTerm"<CR>
" inoremap <silent><leader>n <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

tnoremap <leader>m <C-\><C-n>

let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

let g:comfortable_motion_friction = 100.0
let g:comfortable_motion_air_drag = 1.0

let g:tex_flavor='latex'
let g:vimtex_view_method='mupdf'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
