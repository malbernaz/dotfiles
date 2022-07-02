local cmp = require("cmp_nvim_lsp")
local map = require("malbernaz.utils").map

-- customize diagnostics signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  { signs = true, underline = true, virtual_text = false, update_in_insert = false }
)

map("n", "<leader>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<leader>q", vim.diagnostic.setloclist)

local function on_init(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local function on_attach(_, buffer)
  vim.bo[buffer].omnifunc = "v:lua:vim.lsp.omnifunc"

  local opts = { buffer = buffer }

  map("n", "gD", vim.lsp.buf.declaration, opts)
  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "gi", vim.lsp.buf.implementation, opts)
  map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
  map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
  map("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  map("n", "<space>D", vim.lsp.buf.type_definition, opts)
  map("n", "<space>rn", vim.lsp.buf.rename, opts)
  map("n", "<space>ca", vim.lsp.buf.code_action, opts)
  map("n", "gr", vim.lsp.buf.references, opts)
  map("n", "<space>f", vim.lsp.buf.formatting, opts)
end

local capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local M = {}

function M.make_config(config)
  return vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    on_init = on_init,
    on_attach = on_attach,
  }, config or {})
end

return M
