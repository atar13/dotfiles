return {
    "dstein64/vim-startuptime",
 --    -- "figsoda/nix-develop.nvim",
    "Mofiqul/adwaita.nvim",
    "tomasiser/vim-code-dark",
    "nyoom-engineering/oxocarbon.nvim",
	"EdenEast/nightfox.nvim",
    "mellow-theme/mellow.nvim",
    "ramojus/mellifluous.nvim",
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
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- {"cljoly/telescope-repo.nvim", dependencies = { "airblade/vim-rooter" }},
            "nvim-telescope/telescope-ui-select.nvim",
            -- "nvim-telescope/telescope-fzf-native.nvim",
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            {"dhruvasagar/vim-prosession", dependencies = { "tpope/vim-obsession", } },
        }
    },
	{"romgrk/barbar.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }},
	{"kyazdani42/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" }},
	{"nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }},
	"numToStr/Comment.nvim",
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",
	"mbbill/undotree",
	"ziontee113/icon-picker.nvim",
	{"SmiteshP/nvim-navic", dependencies = { "neovim/nvim-lspconfig" }},
	"frabjous/knap",
	"lambdalisue/suda.vim",
	"tamton-aquib/duck.nvim",
	"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
	"christoomey/vim-tmux-navigator",
	-- 'https://codeberg.org/esensar/nvim-dev-container',
	-- "jamestthompson3/nvim-remote-containers",
	"akinsho/toggleterm.nvim",
	{"folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }},
    -- 'mrcjkb/rustaceanvim',
	-- "David-Kunz/gen.nvim",
    {"ibhagwan/fzf-lua", dependencies = { "nvim-tree/nvim-web-devicons" }},
    { "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {

      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },
    { "camgraff/telescope-tmux.nvim",
      dependencies = {
          "norcalli/nvim-terminal.lua"
      },
    },
    "0xm4n/resize.nvim",
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        opts = {},
    },
}

