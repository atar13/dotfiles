local function nkeymap(key, action, description)
  vim.api.nvim_set_keymap('n', key, action, { noremap = true, silent = true, desc = description })
end

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
      },
    },
  },
  filters = {
    dotfiles = true,
    custom = { "^.git$" }
  },
  renderer = {
    add_trailing = true,
    group_empty = true,
    highlight_git = true,
    full_name = false,
    highlight_opened_files = "icon",
    root_folder_modifier = ":~",
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
  }
})

nkeymap("<leader>e", "<Cmd>NvimTreeToggle<CR>", "Toggle nvim-tree")
