require("toggleterm").setup()

vim.cmd([[
"floating term binds
autocmd TermEnter term://*toggleterm#*
     \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>

"vscode style term binds
autocmd TermEnter term://*toggleterm#*
     \ tnoremap <silent><c-`> <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><c-`> <Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>
inoremap <silent><c-`> <Esc><Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>
]])
