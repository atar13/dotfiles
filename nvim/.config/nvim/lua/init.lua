-- Neovim config in Lua
--require("impatient").enable_profile()
require("settings/vim")
require("plugins")
require("lsp.lsp")
-- -- require("keybinds.which-key")
require("keybinds/keybinds")
require("telescope/telescope")
require("colorscheme")
require("statusline.lualine")
require("bar.barbar")
require("tree.nvim-tree")
require("startup.alpha")
require("git.gitsigns")
require("terminal.toggleterm")
require("picker.icon")
require("discord.presence")
require('custom_marks')
require("scroll.scrollbar")
require("scroll.neoscroll")
require("gui")
require("cursor.specs")

vim.notify = require("notify")

require("todo-comments").setup() --[[ if this is left to plugins.lua it spawns and error on PackerSync ]]

-- TreeSitter Enable
local configs = require 'nvim-treesitter.configs'
configs.setup {
	-- ensure_installed = "maintained", -- Only use parsers that are maintained
	highlight = { -- enable highlighting
		enable = true
	},
	indent = {}
}

-- LSP Enable
-- require("nvim-lsp-installer").setup {
--   automatic_installation = true
-- }
require("mason").setup()
require("mason-lspconfig").setup({ automatic_installation = true })

-- local lsp_installer = require("nvim-lsp-installer")
-- lsp_installer.on_server_ready(function(server)
-- local opts = {}
-- -- Allow lua to work with vim related variables
-- if server.name == "sumneko_lua" then
--   opts = {
--     settings = {
--       Lua = {
--         diagnostics = {
--           globals = { 'vim', 'use' }
--         },
--         --workspace = {
--           -- Make the server aware of Neovim runtime files
--           --library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
--         --}
--       }
--     }
--   }
-- end
-- server:setup(opts)
-- end)

require("luasnip.loaders.from_vscode").lazy_load()

-- Completion Enable
local lsp_symbols = {
	Text = "   (Text) ",
	Method = "   (Method)",
	Function = "   (Function)",
	Constructor = "   (Constructor)",
	Field = " ﴲ  (Field)",
	Variable = "[] (Variable)",
	Class = "   (Class)",
	Interface = " ﰮ  (Interface)",
	Module = "   (Module)",
	Property = " 襁 (Property)",
	Unit = "   (Unit)",
	Value = "   (Value)",
	Enum = " 練 (Enum)",
	Keyword = "   (Keyword)",
	Snippet = "   (Snippet)",
	Color = "   (Color)",
	File = "   (File)",
	Reference = "   (Reference)",
	Folder = "   (Folder)",
	EnumMember = "   (EnumMember)",
	Constant = " ﲀ  (Constant)",
	Struct = " ﳤ  (Struct)",
	Event = "   (Event)",
	Operator = "   (Operator)",
	TypeParameter = "   (TypeParameter)"
}

local cmp = require 'cmp'
cmp.setup({
	confirm_opts = { behavior = cmp.ConfirmBehavior.Replace, select = false },
	snippet = {
		expand = function(args) require('luasnip').lsp_expand(args.body) end
	},
	completion = {
		---@usage The minimum length of a word to complete on.
		keyword_length = 1
	},
	experimental = { ghost_text = true },
	view = { entries = "native" },
	sources = {
		{ name = "nvim_lsp" }, { name = "path" }, { name = "luasnip" },
		 { name = "spell" }, { name = "buffer" },
		{ name = "crates" },
-- { name = "digraphs" },
	},
	mapping = {
		["<s-tab>"] = cmp.mapping.select_prev_item(),
		["<tab>"] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	formatting = {
		format = function(entry, item)
			item.kind = lsp_symbols[item.kind]
			item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
			})[entry.source.name]

			return item
		end
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).

-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['sumneko_lua'].setup {
--   on_attach = on_attach,
--   capabilities = capabilities
-- }

-- -- Code Folding (somehow messed up whichkey )
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = '*',
--   group = exe,
--   desc = 'Unfold on startup',
--   command = 'normal zR'
-- })
--

-- highlight current n
vim.cmd([[
nmap n <Plug>(highlight-current-n-n)
nmap N <Plug>(highlight-current-n-N)

nmap * *N

" Some QOL autocommands
augroup ClearSearchHL
  autocmd!
  " You may only want to see hlsearch /while/ searching, you can automatically
  " toggle hlsearch with the following autocommands
  autocmd CmdlineEnter /,\? set hlsearch
  autocmd CmdlineLeave /,\? set nohlsearch
  " this will apply similar n|N highlighting to the first search result
  " careful with escaping ? in lua, you may need \\?
  autocmd CmdlineLeave /,\? lua require('highlight_current_n')['/,?']()
augroup END
]])

vim.cmd([[
autocmd BufLeave * if &ft == "alpha" | exe "lua require'marks'._on_delete()" | endif
]])
