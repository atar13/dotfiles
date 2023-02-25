-- TODO: look through all the telescope commands (and options that come after the commands)
-- also look at the github again
-- also the planets function
-- commands!
-- current buffer fuzzy find is a noteworthy function
-- key maps
-- treesitter
-- Telescope repo list as well
-- TODO: make a telescope finder for TODOs or fixmes
require("telescope").setup {}
require('telescope').load_extension('fzf')

vim.keymap.set("n", "<Leader>f", require('telescope.builtin').find_files,
               {desc = "Find files (Telescope)"})
vim.keymap.set("n", "<Leader>tg", require('telescope.builtin').live_grep,
               {desc = "Live Grep"})
vim.keymap.set("n", "<Leader>tf", require('telescope.builtin').current_buffer_fuzzy_find, {desc = "Current Buffer Find"})
tmp_opts = {}
tmp_opts.no_ignore=false
-- vim.keymap.set("n", "<Leader>th", require('telescope.builtin').find_files(tmp_opts))
-- {find_command = { "rg", "--files", "--glob", "!.git/*" }}
vim.keymap.set("n", "<Leader>tt", ":TodoTelescope<CR>",
               {desc = "View TODOs (Telescope)"})
-- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
--
require("telescope").load_extension("ui-select")

local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false
      },
    },
  }
}

local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")

telescope.setup({
	defaults = {
		-- `hidden = true` is not supported in text grep commands.
		vimgrep_arguments = vimgrep_arguments,
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
		},
	},
	extensions = {
	    repo = {
	      list = {
		fd_opts = {
		  "--no-ignore-vcs",
		},
		search_dirs = {
		  "~/Dev",
		  "~/Pkgs",
		},
	      },
	    },
	  },
	})

-- must be after telescope setup
require('telescope').load_extension('repo')
