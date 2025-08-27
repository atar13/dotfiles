vim.loader.enable()

vim.g.mapleader = " "

vim.o.guifont = "FiraCode Nerd Font:h8"

-- line numbers (relative)
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = false
vim.opt.autoindent = true

-- line wrapping
vim.opt.wrap = false

-- swpfile, undodir
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

-- keep matches highlighted
vim.opt.hlsearch = true
-- update search matches live
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- when scrolling, keep an 8 line buffer between cursor and bottom
vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.splitright = true
vim.opt.splitbelow = true

-- use system clipboard
vim.cmd("set clipboard+=unnamedplus")

-- set terminal title to current filename
vim.o.title = true

vim.g.c_syntax_for_h = 1

vim.opt.fixendofline = false
