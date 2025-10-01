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

-- Customized navic.get_location() that combines namespaces into a single string.
-- Example: `adam::bob::charlie > foo` is transformed into `a::b::charlie > foo`
local function navic_namespace()
    local navic = require("nvim-navic")
    local old_data = navic.get_data()
    local new_data = {}
    local cur_ns = nil
    local ns_comps = {}

    for _, comp in ipairs(old_data) do
        if comp.type == "Namespace" then
            cur_ns = comp
            table.insert(ns_comps, comp.name)
        else
            -- On the first non-namespace component $c$, collect
            -- previous NS components into a single one and
            -- insert it in front of $c$.
            if cur_ns ~= nil then
                -- Concatenate name and insert
                local num_comps = #ns_comps
                local comb_name = ""
                for idx = 1, num_comps do
                    local ns_name = ns_comps[idx]

                    -- No "::" in front of first component
                    local join = (idx == 1) and "" or "::"

                    if idx ~= num_comps then
                        comb_name = comb_name .. join .. ns_name:sub(1, 1)
                    else
                        comb_name = comb_name .. join .. ns_name
                    end
                end

                cur_ns.name = comb_name
                table.insert(new_data, cur_ns)
                cur_ns = nil
            end

            table.insert(new_data, comp)
        end
    end

    return navic.format_data(new_data)
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
		lualine_x = { navic_namespace, emojis, "encoding", "fileformat", "filetype" },
		-- lualine_x = { emojis, "encoding", "fileformat", "filetype" },
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
