local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- add the Lazy plugin to the vim runtime
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)