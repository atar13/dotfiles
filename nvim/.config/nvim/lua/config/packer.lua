vim.cmd([[packadd packer.nvim]])

return require("packer").startup({
	function(use)
		use({ "wbthomason/packer.nvim" })
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.x",
			requires = { { "nvim-lua/plenary.nvim" } },
		})
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use({ "cljoly/telescope-repo.nvim", requires = { { "airblade/vim-rooter" } } })
		use({ "nvim-telescope/telescope-ui-select.nvim" })
		use({ "nyoom-engineering/oxocarbon.nvim" })
        use({ "EdenEast/nightfox.nvim" })
        use { 'talha-akram/noctis.nvim' }
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
		})
		use({ "mbbill/undotree" })
		use({ "tpope/vim-fugitive" })
		use({ "lewis6991/gitsigns.nvim" })
		use({
			"VonHeikemen/lsp-zero.nvim",
			branch = "v1.x",
			requires = {
				{ "neovim/nvim-lspconfig" },
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim" },

				{ "hrsh7th/nvim-cmp" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "saadparwaiz1/cmp_luasnip" },
				{ "hrsh7th/cmp-nvim-lua" },

				{ "L3MON4D3/LuaSnip" },
				{ "rafamadriz/friendly-snippets" },
			},
		})
		use({ "numToStr/Comment.nvim" })
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
			tag = "nightly",
		})
		use({
			"nvim-lualine/lualine.nvim",
			requires = {
				"kyazdani42/nvim-web-devicons",
				opt = true,
			},
		})
		use({ "akinsho/toggleterm.nvim", tag = "*" })
		use({ "ziontee113/icon-picker.nvim" })
		use({ "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" })
		-- use({ "rmagatti/auto-session" })
        use({ "tpope/vim-obsession" })
        use({ "dhruvasagar/vim-prosession" })
		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
		})
		use("lambdalisue/suda.vim")
		use({
			"tamton-aquib/duck.nvim",
			config = function()
				vim.keymap.set("n", "<leader>dd", function()
					require("duck").hatch("ඞ")
				end, {})
				vim.keymap.set("n", "<leader>dk", function()
					require("duck").cook()
				end, {})
			end,
		})
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		})
		use({ "romgrk/barbar.nvim", requires = "nvim-tree/nvim-web-devicons" })
		-- maybe add
		-- https://github.com/SmiteshP/nvim-navbuddy
		-- https://github.com/Saecki/crates.nvim
        -- use({ "lervag/vimtex" })
        use({ "frabjous/knap" })

        use({ 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim' })
        use({ 'christoomey/vim-tmux-navigator' })
        use({ 'https://codeberg.org/esensar/nvim-dev-container' })
        use({ "jamestthompson3/nvim-remote-containers" })
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
