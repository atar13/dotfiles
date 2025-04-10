require("nvim-treesitter.configs").setup({
	-- ensure_installed = {
	-- 	"c",
	-- 	"lua",
	-- 	"javascript",
	-- 	"typescript",
	-- 	"python",
	-- 	"go",
	-- 	"gosum",
	-- 	"gomod",
	-- 	"rust",
	-- 	"bash",
	-- 	"elsa",
	-- 	"cpp",
	-- 	"java",
	-- 	"haskell",
	-- 	"json",
 --        "jsonc",
	-- 	"yaml",
	-- 	"toml",
	-- 	"dockerfile",
	-- 	"css",
	-- 	"html",
	-- 	"make",
	-- 	"svelte",
	-- 	"zig",
	-- 	"nix",
	-- 	"vim",
	-- 	"query",
 --        "gitignore",
	-- },
	sync_install = false,
	auto_install = false,
	highlight = {
		enable = true,
		-- Disable slow treesitter highlight for large files
		disable = function(_, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},
})
