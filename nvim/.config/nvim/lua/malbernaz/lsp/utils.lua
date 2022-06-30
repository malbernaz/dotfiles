local utils = require("malbernaz.utils")
local cmp = require("cmp_nvim_lsp")

local map = utils.map
local buf = vim.lsp.buf

map("n", "<leader>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<leader>q", vim.diagnostic.setloclist)

local M = {}

function M.on_init(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

function M.on_attach(_, buffn)
  vim.o.omnifunc = "v:lua:vim.lsp.omnifunc"

  local opts = { buffer = buffn }

  map("n", "K", buf.hover, opts)
  map("n", "gD", buf.declaration, opts)
  map("n", "gd", buf.definition, opts)
  map("n", "gi", buf.implementation, opts)
  map("n", "gr", buf.references, opts)
  map("n", "<C-s>", buf.signature_help, opts)
  map("n", "<leader>wa", buf.add_workspace_folder, opts)
  map("n", "<leader>wr", buf.remove_workspace_folder, opts)
  map("n", "<leader>wl", function()
    print(vim.inspect(buf.list_workspace_folders()))
  end, opts)
  map("n", "<leader>D", buf.type_definition, opts)
  map("n", "<leader>rn", buf.rename, opts)
  map("n", "<leader>ca", buf.code_action, opts)
end

M.capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

function M.makeConfig(config)
  return vim.tbl_deep_extend("force", {
    capabilities = M.capabilities,
    on_init = M.on_init,
    on_attach = M.on_attach,
  }, config or {})
end

return M
