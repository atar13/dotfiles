print("running telescope")
return {
    'nvim-telescope/telescope.nvim',
    dir = require("lazy-nix-helper").get_plugin_path("telescope.nvim"),
    dependencies = { 'nvim-lua/plenary.nvim' }
}