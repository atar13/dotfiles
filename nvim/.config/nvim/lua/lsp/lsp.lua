local navic = require("nvim-navic")
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local function show_documentation()
    local filetype = vim.bo.filetype
    if vim.tbl_contains({ 'vim','help' }, filetype) then
        vim.cmd('h '..vim.fn.expand('<cword>'))
    elseif vim.tbl_contains({ 'man' }, filetype) then
        vim.cmd('Man '..vim.fn.expand('<cword>'))
    elseif vim.fn.expand('%:t') == 'Cargo.toml' then
        require('crates').show_popup()
    else
        vim.lsp.buf.hover()
    end
end


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
	-- null-ls format on leader p
	vim.keymap.set('n', '<leader>p', function()
		local params = require('vim.lsp.util').make_formatting_params({})
		client.request('textDocument/formatting', params, nil, bufnr)
	end, { buffer = bufnr })

	-- null-ls format on buffer save 
	-- if client.supports_method("textDocument/formatting") then
	--	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	--	vim.api.nvim_create_autocmd("BufWritePre", {
	--		group = augroup,
	--		buffer = bufnr,
	--		callback = function()
	--			-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
	--			-- vim.lsp.buf.formatting_sync()

	--			-- Selects null-ls as default formatter
	--			local params = require('vim.lsp.util').make_formatting_params({})
	--			client.request('textDocument/formatting', params, nil, bufnr)
	--		end
	--	})
	-- end
	navic.attach(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts) -- TODO: !!!! rebind this (also bind join cmd)
	vim.keymap.set('n', 'M', show_documentation, { noremap = true, silent = true })
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
		bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	-- vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150
}
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
	.protocol
	.make_client_capabilities())

require 'lspconfig'.sumneko_lua.setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT'
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' }
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true)
			},
			telemetry = { enable = false }
		}
	}
}
require('lspconfig')['rust_analyzer'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

require('lspconfig')['pylsp'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

require('lspconfig')['clangd'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

require('lspconfig')['jsonls'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

require('lspconfig')['cssls'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

require('lspconfig')['gopls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

require('lspconfig')['dockerls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

require('lspconfig')['bashls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

require('lspconfig')['hls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
}


util = require "lspconfig/util"
require('lspconfig')['gopls'].setup {
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = { gopls = { analyses = { unusedparams = true }, staticcheck = true } }
}

-- organize import order
function OrgImports(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction",
		params, wait_ms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end

-- vim.api.nvim_create_autocmd("BufWritePre", {
--  pattern = "*.go",
--  command = "lua OrgImports(1000)"
-- })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--  pattern = "*.rs",
--  command = "lua OrgImports(1000)"
-- })

-- format on write
-- vim.api.nvim_create_autocmd("BufWritePre", {
--  pattern = "*.go",
--  command = "lua vim.lsp.buf.formatting_sync(nil, 1000)"
-- })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--  pattern = "*.rs",
--  command = "lua vim.lsp.buf.formatting_sync(nil, 1000)"
-- })

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- require("null-ls").setup({
--     -- you can reuse a shared lspconfig on_attach callback here
--     on_attach = function(client, bufnr)
--         if client.supports_method("textDocument/formatting") then
--             vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--             vim.api.nvim_create_autocmd("BufWritePre", {
--                 group = augroup,
--                 buffer = bufnr,
--                 callback = function()
--                     -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--                     vim.lsp.buf.formatting_sync()
--                 end,
--             })
--         end
--     end,
-- })
