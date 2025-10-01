local capabilities = require("cmp_nvim_lsp").default_capabilities()
local navic = require("nvim-navic")

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

-- vim.lsp.config('rust_analyzer', {
--     capabilities = capabilities,
--     on_attach = on_attach;
-- }

vim.lsp.config('gopls', {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.enable('clangd')
vim.lsp.config('clangd', {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.enable('html')
vim.lsp.config('html', {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config('nil_ls', {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      nix = {
        flake = {
          -- calls `nix flake archive` to put a flake and its output to store
          autoArchive = true,
          -- auto eval flake inputs for improved completion
          autoEvalInputs = true,
        },
      },
    },
})

vim.lsp.config('glslls', {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config('pyright', {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.enable('cssls')
vim.lsp.config('cssls', {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.enable('eslint')
vim.lsp.config('eslint', {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config('autotools_ls', {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  on_attach = on_attach;
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(args)
        local bufmap = function(mode, lhs, rhs)
            local opts = {buffer = true}
            vim.keymap.set(mode, lhs, rhs, opts)
        end


        bufmap("n", "gd", vim.lsp.buf.definition)
        bufmap("n", "gD", vim.lsp.buf.declaration)
        bufmap("n", "gi", vim.lsp.buf.implementation)
        bufmap("n", "gr", vim.lsp.buf.references)
        bufmap("n", "go", vim.lsp.buf.type_definition)
        bufmap("n", "gs", vim.lsp.buf.signature_help)
        bufmap("n", "K", vim.lsp.buf.hover)
        bufmap("n", "gl", vim.diagnostic.open_float)
        bufmap("n", "[d", vim.diagnostic.goto_next)
        bufmap("n", "]d", vim.diagnostic.goto_prev)
        bufmap("n", "<leader>vws", vim.lsp.buf.workspace_symbol)
        bufmap("n", "<leader>vca", vim.lsp.buf.code_action)
        bufmap("n", "<leader>vrn", vim.lsp.buf.rename)
        bufmap("n", "<leader>o", vim.lsp.buf.format)

        -- local client = vim.lsp.get_client_by_id(args.data.client_id)
        -- navic.attach(client, args.buf)
    end
})

-- cmp
require('luasnip.loaders.from_vscode').lazy_load()

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = {behavior = cmp.SelectBehavior.Select}

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

cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    sources = {
      {name = 'path'},
      {name = 'nvim_lsp', keyword_length = 1},
      {name = 'buffer', keyword_length = 3},
      {name = 'luasnip', keyword_length = 2},
    },
    window = {
      documentation = cmp.config.window.bordered()
    },
    formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
        item.kind = lsp_symbols[item.kind]
        local menu_icon = {
          nvim_lsp = '[LSP]',
          luasnip = '[Snippet]',
          buffer = '[Buffer]',
          path = '[Path]',
        }
  
        item.menu = menu_icon[entry.source.name]
        return item
      end,
    },
    mapping = {
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
      ['<Down>'] = cmp.mapping.select_next_item(select_opts),
  
      ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
      ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
  
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
  
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-y>'] = cmp.mapping.confirm({select = true}),
      ['<CR>'] = cmp.mapping.confirm({select = false}),
  
      ['<C-f>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, {'i', 's'}),
  
      ['<C-b>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {'i', 's'}),
  
      ['<Tab>'] = cmp.mapping(function(fallback)
        local col = vim.fn.col('.') - 1
  
        if cmp.visible() then
          cmp.select_next_item(select_opts)
        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
          fallback()
        else
          cmp.complete()
        end
      end, {'i', 's'}),
  
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item(select_opts)
        else
          fallback()
        end
      end, {'i', 's'}),
    },
  })

local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = '»'})

vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
        -- border = 'rounded',
        source = 'always',
    },
})

-- linting
require('lint').linters_by_ft = {
    go = {'golangcilint',},
    html = { 'tidy', }
}

vim.keymap.set("n", "<leader>ll", function()
    require("lint").try_lint()
  end, { desc = "Lint current file"})


-- formatting
require("conform").setup({
  formatters_by_ft = {
    go = { "goimports", "gofmt" },
    rust = { "rustfmt" },
    lua = { "stylua" },
    nix = { "nixpkgs_fmt" },
    toml = { "taplo" },
    yaml = { "yamlfix" },
    json = { { "prettierd", "prettier" } },
    python = { "isort", "ruff_fix", "ruff_format" },
    javascript = { { "prettierd", "prettier" } },
    javascriptreact = { { "prettierd", "prettier" } },
    css = { { "prettierd", "prettier" } },
    markdown = { { "prettierd", "prettier" } },
    bash = { "beautysh" },
    proto = { "buf" },
    just = { "just" },
    html = { "djlint" },
    cmake = { "cmake_format" },
    -- Use the "*" filetype to run formatters on all filetypes.
    ["*"] = { "codespell" },
    -- Use the "_" filetype to run formatters on filetypes that don't have other formatters configured.
    ["_"] = { "trim_whitespace" },
  },
})

vim.keymap.set("n", "<leader>pp", function()
    require("conform").format({ timeout_ms = 500, lsp_fallback = true})
  end, { desc = "Format current file"})