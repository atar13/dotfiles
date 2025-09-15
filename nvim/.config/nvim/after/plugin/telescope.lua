local builtin = require('telescope.builtin')

-- allow text search in hidden files but not in .git folder
local vimgrep_arguments = { unpack(require('telescope.config').values.vimgrep_arguments) }
table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")

require('telescope').setup({
	defaults = {
		vimgrep_arguments = vimgrep_arguments,
	},
	pickers = {
		find_files = {
			-- search for hidden files but ignore files in .git folder 
			find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!.git/*" },
		},
        colorscheme = {
            enable_preview = true,
        }
	},
	extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                          -- the default case_mode is "smart_case"
        },
        -- repo = {
        --   list = {
        --       fd_opts = {
        --         "--no-ignore-vcs",
        --       },
        --       search_dirs = {
        --         "~/Dev",
        --         "~/Pkgs",
        --       },
        --     },
        -- },
    },
})


vim.keymap.set("n", "<leader>fr", require('telescope.builtin').resume, {desc = "Open last Telescope picker"})
vim.keymap.set("n", "<leader>fi", require('telescope.builtin').find_files, {desc = "Find files (Telescope)"})
vim.keymap.set("n", "<leader>fj", require('telescope.builtin').git_files, {desc = "Find Git files (Telescope)"})
vim.keymap.set("n", "<leader>fg", require('telescope.builtin').git_files, {desc = "Find Git files (Telescope)"})
vim.keymap.set("n", "<leader>fs", function() builtin.grep_string({ search = vim.fn.input("Find: ") }); end)
vim.keymap.set("n", "<Leader>fp", require('telescope.builtin').live_grep, {desc = "Workdir Live Grep"})
vim.keymap.set("n", "<Leader>fz", require('telescope.builtin').current_buffer_fuzzy_find, {desc = "Current Buffer Fuzzy Find"})
vim.keymap.set("n", "<leader>fb", require('telescope.builtin').buffers, {})
vim.keymap.set("n", "<leader>fc", require('telescope.builtin').colorscheme, {})
vim.keymap.set("n", "<leader>fd", require('telescope.builtin').diagnostics, {})
vim.keymap.set("n", "<leader>fk", require('telescope.builtin').keymaps, {})
-- vim.keymap.set("n", "<leader>fp", require('telescope').extensions.repo.cached_list, {})
vim.keymap.set('n', '<Leader>fo', '<cmd>Telescope prosession<CR>')

-- require('telescope').extensions.repo.cached_list{file_ignore_patterns={"/%.cache/", "/%.cargo/", "/%.local/"}}

require('telescope').load_extension('fzf')
-- require('telescope').load_extension('repo')
require("telescope").load_extension("ui-select")
require('telescope').load_extension('prosession')
require('telescope').load_extension('tmux')

