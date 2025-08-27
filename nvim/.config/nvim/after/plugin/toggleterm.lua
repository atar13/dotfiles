require("toggleterm").setup()

vim.cmd([[
"floating term binds
autocmd TermEnter term://*toggleterm#*
     \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>

"vscode style term binds
autocmd TermEnter term://*toggleterm#*
     \ tnoremap <silent><c-y> <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><c-y> <Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>
inoremap <silent><c-y> <Esc><Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>
]])
