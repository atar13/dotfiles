require("todo-comments").setup()

vim.keymap.set("n", "<Leader>tt", ":TodoTelescope<CR>", { desc = "View TODOs (Telescope)" })
