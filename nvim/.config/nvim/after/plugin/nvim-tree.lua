require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = { adaptive_size = false },
	filters = { dotfiles = false, custom = { "^.git$" } },
	git = { ignore = false },
	renderer = {
		add_trailing = true,
		group_empty = true,
		highlight_git = true,
		full_name = false,
		highlight_opened_files = "icon",
		root_folder_modifier = ":~",
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = { corner = "└", edge = "│", item = "│", none = " " },
		},
	},
})

vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle nvim-tree" })
