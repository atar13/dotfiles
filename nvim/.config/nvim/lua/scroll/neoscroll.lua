require('neoscroll').setup({
	mappings = { '<C-u>', '<C-d>', '<C-b>',
		'<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
	hide_cursor = false,
	stop_eof = true,
	respect_scrolloff = false,
	cursor_scrolls_alone = true,
	performance_mode = false 
})
function Nkeymap(key, action, description)
    vim.api.nvim_set_keymap('n', key, action,
                            {noremap = true, silent = true, desc = description})
end
-- Nkeymap("K",  ':lua require("neoscroll").scroll(-5, true, 300, "cubic")<CR>', "Smooth scroll up 5 lines")
-- Nkeymap("J",  ':lua require("neoscroll").scroll(5, true, 300, "cubic")<CR>', "Smooth scroll down 5 lines")
-- TODO: !!! rebind hover on K and join command
