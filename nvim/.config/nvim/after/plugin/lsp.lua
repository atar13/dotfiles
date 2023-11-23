local lsp = require("lsp-zero")

lsp.preset("recommended")

-- prefer system utilities if available
require("mason").setup({
	PATH = "append",
})

-- "hls", -- TODO: revisit this once ghcup is installed
lsp.ensure_installed({
	"lua_ls",
	"rnix",
	"rust_analyzer",
	"gopls",
	"golangci_lint_ls",
	"html",
	"cssls",
	"clangd",
    "cmake",
    -- "neocmake",
    -- "cpptools",
	"ruff_lsp",
	"dockerls",
	"docker_compose_language_service",
	--"bashls",
	--"yamlls",
	--"jsonls",
	--"taplo",
	"tsserver",
	"tailwindcss",
	-- "ltex",
	--"eslint",
})

-- Fix Undefined global 'vim'
lsp.configure("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})
local lsp_symbols = {
	Text = "   (Text) ",
	Method = "   (Method)",
	Function = " λ (Function)",
	Constructor = "   (Constructor)",
	Field = " [.]  (Field)",
	Variable = "[] (Variable)",
	Class = "  {}  (Class)",
	Interface = " {}  (Interface)",
	Module = "   (Module)",
	Property = " [.] (Property)",
	Unit = "   (Unit)",
	Value = " #  (Value)",
	Enum = " {} (Enum)",
	Keyword = "   (Keyword)",
	Snippet = "   (Snippet)",
	Color = "   (Color)",
	File = "   (File)",
	Reference = "   (Reference)",
	Folder = "   (Folder)",
	EnumMember = "   (EnumMember)",
	Constant = " #  (Constant)",
	Struct = " {}  (Struct)",
	Event = "   (Event)",
	Operator = " ⩲ (Operator)",
	TypeParameter = "   (TypeParameter)",
}

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	formatting = {
		format = function(entry, item)
			item.kind = lsp_symbols[item.kind]
			item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
			})[entry.source.name]

			return item
		end,
	},
})

lsp.set_preferences({
	suggest_lsp_servers = false,
})

lsp.on_attach(function(client, bufnr)
	require("nvim-navic").attach(client, bufnr)

	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.keymap.set("n", "<leader>o", function()
		vim.lsp.buf.format()
	end, opts)
end)

lsp.setup()
