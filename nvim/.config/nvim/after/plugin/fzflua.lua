vim.keymap.set("n", "<leader>j", require('fzf-lua').git_files, {desc = "Open fzf-lua git files picker"})
vim.keymap.set("n", "<leader>ff", require('fzf-lua').files, {desc = "Open fzf-lua files picker"})
vim.keymap.set("n", "<leader>fl", require('fzf-lua').grep_project, {desc = "Project-wide grep"})
