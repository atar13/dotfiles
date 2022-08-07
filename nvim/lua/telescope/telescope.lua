-- TODO: look through all the telescope commands (and options that come after the commands)
-- also look at the github again
-- also the planets function
-- commands!
-- current buffer fuzzy find is a noteworthy function
-- TODO: make a telescope finder for TODOs or fixmes

vim.keymap.set("n", "<Leader>ff", require('telescope.builtin').find_files, { desc = "Find files (Telescope)" })
-- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
