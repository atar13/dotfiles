require("icon-picker").setup({
	disable_legacy_commands = false,
})

-- vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert alt_font symbols nerd_font emoji<cr>")
vim.keymap.set("n", "<leader>0", "<cmd>PickEverything<cr>")
