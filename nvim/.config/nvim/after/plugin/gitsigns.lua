require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Jump through git hunks
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "gp", gs.preview_hunk_inline)
		map("n", "<leader>gb", gs.blame_line)
		map("n", "<leader>gd", gs.diffthis)
		map("n", "<leader>gl", gs.toggle_linehl)

		-- map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
		-- map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
		-- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
		-- map('n', '<leader>td', gs.toggle_deleted)
		-- map('n', '<leader>hR', gs.reset_buffer)
		-- map('n', '<leader>hS', gs.stage_buffer)
		-- map('n', '<leader>hu', gs.undo_stage_hunk)
	end,
})
