vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

	-- Plugin Manager
	use 'wbthomason/packer.nvim'

	-- use 'lewis6991/impatient.nvim'

	-- Colorscheme
	use 'yashguptaz/calvera-dark.nvim'

	use {
	    'meliora-theme/neovim',
	    requires = {'rktjmp/lush.nvim'}
	}
	use { 'Shadorain/shadotheme' }

	-- icons
	use 'kyazdani42/nvim-web-devicons'

	-- Status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- Bar
	use { 'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }

	-- File explorer
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons' -- optional, for file icons
		},
		tag = 'nightly'
	}

	-- Neovim LSP configuration
	use {
		"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig"
	}
	-- Linters and formatters
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup({
				-- TODO: move this to another file
				sources = { require("null-ls").builtins.formatting.lua_format }
			})
		end,
		requires = { "nvim-lua/plenary.nvim" }
	})

	use { "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" }

	-- TreeSitter (Syntax Highlighting)
	use 'windwp/nvim-ts-autotag'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			require('nvim-treesitter.install').update({ with_sync = true })
		end,
		config = function()
			require("nvim-treesitter.configs").setup {
				autotag = {
					enable = true
				}
			}
		end
	}

	-- Telescope (fuzzy finding)
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use 'cljoly/telescope-repo.nvim'

	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'
	use 'f3fora/cmp-spell'
	use 'dmitmel/cmp-digraphs'

	-- Completion
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	-- use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'

	-- git
	use {
		'lewis6991/gitsigns.nvim',
		config = function() require('gitsigns').setup() end
	}

	-- wildmenu
	use {
		'gelguy/wilder.nvim',
		config = function()
			local wilder = require('wilder')
			wilder.setup({ modes = { ':', '/', '?' } })
			-- wilder.set_option('renderer', wilder.popupmenu_renderer(
			--   wilder.popupmenu_palette_theme({
			--     -- 'single', 'double', 'rounded' or 'solid'
			--     -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
			--     border = 'rounded',
			--     max_height = '75%', -- max height of the palette
			--     min_height = 0, -- set to the same as 'max_height' for a fixed height window
			--     prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
			--     reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
			--   })
			-- ))
			wilder.set_option('renderer', wilder.popupmenu_renderer({
				highlighter = wilder.basic_highlighter(),
				left = { ' ', wilder.popupmenu_devicons() },
				right = { ' ', wilder.popupmenu_scrollbar() }
			}))
		end
	}

	use {
		"akinsho/toggleterm.nvim",
		tag = 'v2.*',
		config = function() require("toggleterm").setup() end
	}

	use {
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	use { 'nvim-telescope/telescope-ui-select.nvim' }
	use({
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker").setup({
				disable_legacy_commands = false
			})
		end,
	})

	use {
		"rktjmp/highlight-current-n.nvim",
		config = function()
			require("highlight_current_n").setup({
				highlight_group = "IncSearch" -- highlight group name to use for highlight
			})
		end
	}

	use {
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup {
				mapping = { "jj" }, -- a table with mappings to use
				timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
				clear_empty_lines = false, -- clear line after escaping if there is only whitespace
				keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
			}
		end,
	}

	use {
		'chipsenkbeil/distant.nvim',
		config = function()
			require('distant').setup {
				-- Applies Chip's personal settings to every machine you connect to
				-- 1. Ensures that distant servers terminate with no connections
				-- 2. Provides navigation bindings for remote directories
				-- 3. Provides keybinding to jump into a remote file's parent directory
				['*'] = require('distant.settings').chip_default()
			}
		end
	}

	use 'andweeb/presence.nvim'

	use {
		'rmagatti/auto-session',
		config = function()
			require("auto-session").setup {
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
			}
		end
	}

	use 'chentoast/marks.nvim'
	use 'karb94/neoscroll.nvim'
	use "petertriho/nvim-scrollbar"

	use { 'edluffy/specs.nvim' }

	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}


	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
			}
		end
	}

	use {
		'saecki/crates.nvim',
		event = { "BufRead Cargo.toml" },
		requires = { { 'nvim-lua/plenary.nvim' } },
		config = function()
			local null_ls = require('null-ls')
			require('crates').setup {
				null_ls = {
					enabled = true,
					name = "crates.nvim",
				},
			}
		end,
	}

	use {
		'rcarriga/nvim-notify',
		config = function()
			require("notify").setup {
				render = "minimal"
			}
		end
	}

	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	}
	use 'antoinemadec/FixCursorHold.nvim'
	use {'nyoom-engineering/oxocarbon.nvim'}

	use 'lambdalisue/suda.vim'

	use 'glapa-grossklag/elsa.vim'

	use 'tamton-aquib/duck.nvim'

	-- start screen
	use {
		"goolord/alpha-nvim",
		config = function()
			local alpha = require 'alpha'
			local dashboard = require 'alpha.themes.dashboard'
			-- dashboard.section.header.val = {
			--   [[                               __                ]],
			--   [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
			--   [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
			--   [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
			--   [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
			--   [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
			-- }
			dashboard.section.header.val = {
				[[                    &  &&& &&                     ]],
				[[                 &&&&&&&&&                        ]],
				[[                &&&&|&&&&\&                       ]],
				[[                 &&&&&&&&&&&& &  & &              ]],
				[[                 &&&|&&&/~&&   &  & &             ]],
				[[                  &&/|\& &&~| && &&&&             ]],
				[[                    \/~/  /_/_&&_&&/ &            ]],
				[[                     /~| &  /|&  &&&&             ]],
				[[               &  \___|/|\  /|&& &                ]],
				[[     &   &&&&&&&\_ /~|\_/   /|\ &                 ]],
				[[     &  &&&&\__      //~|   |/                    ]],
				[[    & &&\|&          |/ /|\\|                     ]],
				[[      && &&  & &    |/  \| |//~                   ]],
				[[              &    /_/_/ //~\                     ]],
				[[                      /~/&/~/                     ]],
				[[                      /~\/~&                      ]],
				[[                         _/&&_&&&&&&              ]],
				[[                          /&&&&&_&&&              ]],
				[[            :___________./~~~\.___________:       ]],
				[[             \                           /        ]],
				[[              \_________________________/         ]],
				[[              (_)                     (_)         ]],
			}
			dashboard.section.buttons.val = {
				dashboard.button("e", "  New file",
					":ene <BAR> startinsert <CR>"),
				dashboard.button("q", "  Quit", ":qa<CR>")
			}
			-- local handle = io.popen('fortune')
			-- local fortune = handle:read("*a")
			-- handle:close()
			dashboard.section.footer.val = "hello there"
			dashboard.config.opts.noautocmd = true
			vim.cmd [[autocmd User AlphaReady echo 'ready']]
			alpha.setup(dashboard.config)
		end
	}
end)

--[=[
TODO:
https://github.com/glacambre/firenvim
https://github.com/windwp/nvim-autopairs
https://github.com/simrat39/rust-tools.nvim (needs https://github.com/nvim-telescope/telescope-ui-select.nvim)
https://github.com/simrat39/symbols-outline.nvim
https://github.com/pwntester/octo.nvim

https://github.com/themercorp/themer.lua
https://github.com/Iron-E/nvim-highlite
https://github.com/tjdevries/colorbuddy.nvim

https://github.com/wakatime/vim-wakatime

https://github.com/bennypowers/nvim-regexplainer
]=] --
