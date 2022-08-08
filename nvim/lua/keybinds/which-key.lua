-- local which_key = require('which-key')

-- local opts = {
--   mode = "n", -- NORMAL mode
--   prefix = "<leader>",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- }

-- local mappings = {
--   name = "file", -- optional group name
--   f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--   -- r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false, buffer = 123 }, -- additional options for creating the keymap
--   n = { "New File" }, -- just a label. don't create any mapping
--   e = "Edit File", -- same as above
--   ["1"] = "which_key_ignore", -- special label to hide it in the popup
--   b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
-- }

-- which_key.register(mappings, opts)

