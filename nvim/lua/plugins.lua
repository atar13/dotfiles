vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- Plugin Manager
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'yashguptaz/calvera-dark.nvim'

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Bar
  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly'
  }

  -- Neovim LSP configuration
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- TreeSitter (Syntax Highlighting)
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Telescope (fuzzy finding)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use 'f3fora/cmp-spell'
  use 'dmitmel/cmp-digraphs'

  -- Completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

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
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
      }
      -- local handle = io.popen('fortune')
      -- local fortune = handle:read("*a")
      -- handle:close()
      dashboard.section.footer.val = "footer"
      dashboard.config.opts.noautocmd = true
      vim.cmd [[autocmd User AlphaReady echo 'ready']]
      alpha.setup(dashboard.config)
    end
  }
end)
