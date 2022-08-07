local function move(direction)
  if (direction == "left") then
    return "<C-W><C-H>"
  elseif (direction == "right") then
    return "<C-W><C-L>"
  elseif (direction == "up") then
    return "<C-W><C-K>"
  elseif (direction == "down") then
    return "<C-W><C-J>"
  else
    return ""
  end
end

local function nkeymap(key, map)
  vim.api.nvim_set_keymap('n', key, map, { noremap = true })
end

vim.keymap.set("n", "<Leader><Bslash>", ":source $MYVIMRC<CR>", { remap = true, desc = "Reload Neovim config" })

-- Split binds
vim.keymap.set("n", "<Leader>l", ":vsp<CR>", { remap = true, desc = "Open new vertical split", silent = true })
vim.keymap.set("n", "<Leader>k", ":sp<CR>", { remap = true, desc = "Open new horizontal split", silent = true })

vim.keymap.set("n", "<C-h>", move("left"), { remap = true, desc = "Move to left split" })
vim.keymap.set("n", "<C-l>", move("right"), { remap = true, desc = "Move to right split" })
vim.keymap.set("n", "<C-k>", move("up"), { remap = true, desc = "Move up a split" })
vim.keymap.set("n", "<C-j>", move("down"), { remap = true, desc = "Move down a split" })

vim.keymap.set("n", "<Leader>;", "<C-W>R", { remap = true, desc = "Swap splits" })


-- Clear highlights
vim.keymap.set("n", "<Leader>h", ":noh<CR>", { remap = true, silent = true })

-- LSP
nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')


-- indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
