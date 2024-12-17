-- TODO check extensions (https://github.com/nvim-lualine/lualine.nvim#extensions)
local navic require('nvim-navic')

local function emojis()
	return [[🌋 🌊 🦛]]
end

local function session()
	local session_name = require("auto-session-library").current_session_name()
	return " " .. session_name
end

local function get_navic() 
    if navic.is_available() then
        return "" .. get_location()
    end
    return ""
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		-- theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "Outline" },
		-- disabled_filetypes = {
		--   statusline = {},
		--   winbar = {},
		-- },
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		-- refresh = {
		-- 	statusline = 1000,
		-- 	tabline = 1000,
		-- 	winbar = 1000,
		-- },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { session, "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		-- lualine_x = { "%{%v:lua.require'nvim-navic'.get_location()%}", emojis, "encoding", "fileformat", "filetype" },
		-- lualine_x = { get_navic, emojis, "encoding", "fileformat", "filetype" },
		lualine_x = { emojis, "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	-- tabline = {},
	-- winbar = {},
	inactive_winbar = {},
	extensions = { "nvim-tree", "toggleterm" },
})
