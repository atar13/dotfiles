" Plugins will be downloaded under the specified directory.
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
" Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'sakshamgupta05/vim-todo-highlight'
Plug 'tpope/vim-fugitive'
Plug 'akinsho/toggleterm.nvim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-surround'

" Plug 'kjssad/quantum.vim'
Plug 'liuchengxu/space-vim-theme'

Plug 'lervag/vimtex'
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plug 'prabirshrestha/asyncomplete.vim'

Plug 'Chiel92/vim-autoformat'
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
" set wrap
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set hidden
set tabstop=2
set shiftwidth=4
set encoding=utf-8
set cmdheight=2
set updatetime=300
set autochdir
set splitright

" Disables theme background color to use terminal's
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
" colorscheme material

" let g:material_theme_style = 'darker'

if (has('termguicolors'))
  set termguicolors
endif

set background=dark

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
tnoremap <leader>h <C-\><C-N><C-w>h
tnoremap <leader>j <C-\><C-N><C-w>j
tnoremap <leader>k <C-\><C-N><C-w>k
tnoremap <leader>l <C-\><C-N><C-w>l
inoremap <leader>h <C-\><C-N><C-w>h
inoremap <leader>j <C-\><C-N><C-w>j
inoremap <leader>k <C-\><C-N><C-w>k
inoremap <leader>l <C-\><C-N><C-w>l
nnoremap <leader>h <C-w>h <CR>
nnoremap <leader>j <C-w>j <CR>
nnoremap <leader>k <C-w>k <CR>
nnoremap <leader>l <C-w>l <CR>


nnoremap <leader>n <C-w>v <bar> :e . <CR>
nnoremap <leader>o :e . <CR>


" set clipboard+=unnamedplus
set clipboard^=unnamed,unnamedplus
" System clipboard copy in visual mode
" vnoremap <leader>;; "+y <CR>
" nnoremap <leader>;; "+y <CR>
" System clipboard paste in normal mode
" nnoremap <leader>p "+p <CR>
nnoremap x "_x
vnoremap x "_x

" barbar keybinds

" Indentation binds
vnoremap < <gv
vnoremap > >gv


" Set custom comment characters for different file types
autocmd FileType apache setlocal commentstring=#\ %s
autocmd FileType c setlocal commentstring=//\ %s

autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><leader>. <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><leader>. <Cmd>exe v:count1 . "ToggleTerm"<CR>
" inoremap <silent><leader>n <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

tnoremap <C-q> <C-\><C-n>

let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

let g:comfortable_motion_friction = 100.0
let g:comfortable_motion_air_drag = 1.0

" let g:vimtex_view_general_viewer = 'qpdfview'
" let g:vimtex_view_general_options
" \ = '--unique @pdf\#src:@tex:@line:@col'
" let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_view_general_viewer = 'evince'
let g:tex_flavor='latex'
" let g:vimtex_view_method='qpdfview'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" barbar keybinds
" Move to previous/next
nnoremap <silent>    <A-q> :BufferPrevious<CR>
nnoremap <silent>    <A-w> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-Q> :BufferMovePrevious<CR>
nnoremap <silent>    <A-W> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseAllButPinned<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used
"
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use j and k to scroll coc.nvim autocompletion 
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

