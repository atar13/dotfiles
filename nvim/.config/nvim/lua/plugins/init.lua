local plugins = {
    "dstein64/vim-startuptime",
    "figsoda/nix-develop.nvim",
    "Mofiqul/adwaita.nvim",
    "tomasiser/vim-code-dark",
    "nyoom-engineering/oxocarbon.nvim",
	"EdenEast/nightfox.nvim",
    "mellow-theme/mellow.nvim",
    "ramojus/mellifluous.nvim",
	-- {"kartikp10/noctis.nvim", deps = { "rktjmp/lush.nvim" }},
    -- {"scottmckendry/cyberdream.nvim", lazy = false, priority = 1000},
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lua",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"mfussenegger/nvim-lint",
	"stevearc/conform.nvim",
	"nvim-treesitter/nvim-treesitter",
	{"nvim-telescope/telescope.nvim",
        lazy = false,
        deps = {
            "nvim-lua/plenary.nvim",
            {"cljoly/telescope-repo.nvim", deps = { "airblade/vim-rooter" }},
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            {"dhruvasagar/vim-prosession", deps = { "tpope/vim-obsession", } },
        }
    },
	{"romgrk/barbar.nvim", deps = { "nvim-tree/nvim-web-devicons" }},
	{"kyazdani42/nvim-tree.lua", deps = { "nvim-tree/nvim-web-devicons" }},
	{"nvim-lualine/lualine.nvim", deps = { "nvim-tree/nvim-web-devicons" }},
	"numToStr/Comment.nvim",
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",
	"mbbill/undotree",
	"ziontee113/icon-picker.nvim",
	{"SmiteshP/nvim-navic", deps = { "neovim/nvim-lspconfig" }},
	"frabjous/knap",
	"lambdalisue/suda.vim",
	"tamton-aquib/duck.nvim",
	"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
	"christoomey/vim-tmux-navigator",
	-- 'https://codeberg.org/esensar/nvim-dev-container',
	-- "jamestthompson3/nvim-remote-containers",
	"akinsho/toggleterm.nvim",
	{"folke/todo-comments.nvim", deps = { "nvim-lua/plenary.nvim" }},
    'mrcjkb/rustaceanvim',
	"David-Kunz/gen.nvim",
}

local function istable(t) return type(t) == 'table' end

local splitRepoName = function(pluginOwnerRepo)
	local owner, repo = string.match(pluginOwnerRepo, "(.*)/(.*)")
	return repo
end

function nixifyPlugin(plugin)
	if istable(plugin) then
		local dependencyTable = {}
		for i, dep in ipairs(plugin["deps"]) do
			dependencyTable[#dependencyTable+1] = nixifyPlugin(dep)
		end

		if #dependencyTable == 1 then
			dependencyTable = dependencyTable[1]
		end

		return {
			plugin[1],
			dir = require("lazy-nix-helper").get_plugin_path(splitRepoName(plugin[1])),
			dependencies = dependencyTable,
		}
	else
		return {
			plugin,
			dir = require("lazy-nix-helper").get_plugin_path(splitRepoName(plugin))
		}
	end
end

-- helper function to convert my plugin list to a lazy.nvim compatible 
-- plugin list that specifies "dir" from "lazy-nix-helper"
-- https://github.com/b-src/lazy-nix-helper.nvim
local nixifyPlugins = function(plugins)
	local nixedPlugins = {}
	for i, plugin in ipairs(plugins) do
		nixedPlugins[#nixedPlugins+1] = nixifyPlugin(plugin)
	end
	return nixedPlugins
end

return nixifyPlugins(plugins)
