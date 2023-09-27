-- indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- clear highlights
vim.keymap.set("n", "<leader>h", ":noh<CR>")

-- sets newline characters to ↲ and tab to »
vim.cmd("set listchars=tab:»\\ ,trail:-,eol:↲")
vim.keymap.set("n", "<leader>9", ":set list!<CR>", { noremap = true, silent = true, desc = "Toggle listchars" })

-- Split binds
vim.keymap.set("n", "<Leader>l", ":vsp<CR>", { desc = "Open new vertical split", silent = true })
vim.keymap.set("n", "<Leader>k", ":sp<CR>", { desc = "Open new horizontal split", silent = true })

-- vim.keymap.set("n", "<C-h>", "<C-W><C-H>", { desc = "Move to left split" })
-- vim.keymap.set("n", "<C-l>", "<C-W><C-L>", { desc = "Move to right split" })
-- vim.keymap.set("n", "<C-k>", "<C-W><C-K>", { desc = "Move up a split" })
-- vim.keymap.set("n", "<C-j>", "<C-W><C-J>", { desc = "Move down a split" })

vim.keymap.set("n", "<Leader>;", "<C-W>R", { desc = "Swap splits" })

-- visual mode bind to move selected blocks up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- don't move cursor on normal mode join
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor in the middle for vertical jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor in the middle for jumping thorugh searches
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste and replace selected text without changing vim clipoard register
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- find and replace for currently selected word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- enter terminal mode
vim.keymap.set("n", "<C-i>", ":term<CR>")

-- exit terminal mode 
vim.keymap.set("t", "<C-s>", "<C-\\><C-n>")
