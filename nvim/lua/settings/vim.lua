-- constants
local tab_len = 4

-- Set leader to space key
vim.g.mapleader = ' '

vim.wo.wrap = true

vim.g.syntax_on = true

-- Use system clipboard for yanking/pasting
vim.o.clipboard = vim.o.clipboard .. "unnamedplus"

-- Tabs and indentation
vim.bo.autoindent = true
vim.bo.tabstop = tab_len
vim.bo.shiftwidth = tab_len
vim.bo.softtabstop = tab_len
vim.bo.expandtab = true

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Undo
vim.bo.swapfile = false
vim.bo.undofile = true
vim.opt.undodir = "/home/atarbinian/.nvim/undodir"

-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- spelling
vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

-- sets newline characters to $
-- vim.cmd('set list listchars=tab:>\ ,trail:-,eol:$')

-- mouse
vim.cmd('set mouse+=a')
