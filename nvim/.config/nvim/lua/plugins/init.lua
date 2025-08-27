-- local function istable(t) return type(t) == 'table' end

-- local splitRepoName = function(pluginOwnerRepo)
-- 	local owner, repo = string.match(pluginOwnerRepo, "(.*)/(.*)")
-- 	return repo
-- end

-- function nixifyPlugin(plugin)
-- 	if istable(plugin) then
-- 		local dependencyTable = {}
-- 		for i, dep in ipairs(plugin["dependencies"]) do
-- 			dependencyTable[#dependencyTable+1] = nixifyPlugin(dep)
-- 		end

-- 		if #dependencyTable == 1 then
-- 			dependencyTable = dependencyTable[1]
-- 		end

-- 		return {
-- 			plugin[1],
-- 			dir = require("lazy-nix-helper").get_plugin_path(splitRepoName(plugin[1])),
-- 			dependencies = dependencyTable,
-- 		}
-- 	else
-- 		return {
-- 			plugin,
-- 			dir = require("lazy-nix-helper").get_plugin_path(splitRepoName(plugin))
-- 		}
-- 	end
-- end

-- -- helper function to convert my plugin list to a lazy.nvim compatible 
-- -- plugin list that specifies "dir" from "lazy-nix-helper"
-- -- https://github.com/b-src/lazy-nix-helper.nvim
-- local nixifyPlugins = function(plugins)
-- 	local nixedPlugins = {}
-- 	for i, plugin in ipairs(plugins) do
-- 		nixedPlugins[#nixedPlugins+1] = nixifyPlugin(plugin)
-- 	end
-- 	return nixedPlugins
-- end

-- return nixifyPlugins(plugins)

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    require('plugins.install')
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
--   install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
