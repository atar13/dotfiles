-- Example mapping to toggle outline
vim.keymap.set("n", "<leader>r", "<cmd>Outline<CR>",
    { desc = "Toggle Outline" })

require("outline").setup {
    -- Your setup opts here (leave empty to use defaults)
}
