local utils = require("malbernaz.utils")
local cmp = require("cmp_nvim_lsp")

local lsp = vim.lsp
local map = utils.map
local set = utils.set

local M = {}

function M.on_init(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

function M.on_attach()
  set("omnifunc", "v:lua:vim.lsp.omnifunc")
  map("n", "gD", ":lua vim.lsp.buf.declaration()<cr>")
  map("n", "gd", ":lua vim.lsp.buf.definition()<cr>")
  map("n", "K", ":lua vim.lsp.buf.hover()<cr>")
  map("n", "gi", ":lua vim.lsp.buf.implementation()<cr>")
  map("n", "<C-s>", ":lua vim.lsp.buf.signature_help()<cr>")
  map("n", "<leader>wa", ":lua vim.lsp.buf.add_workspace_folder()<cr>")
  map("n", "<leader>wr", ":lua vim.lsp.buf.remove_workspace_folder()<cr>")
  map("n", "<leader>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>")
  map("n", "<leader>D", ":lua vim.lsp.buf.type_definition()<cr>")
  map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<cr>")
  map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<cr>")
  map("n", "gr", ":lua vim.lsp.buf.references()<cr>")
  map("n", "<leader>e", ":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>")
  map("n", "[d", ":lua vim.lsp.diagnostic.goto_prev()<cr>")
  map("n", "]d", ":lua vim.lsp.diagnostic.goto_next()<cr>")
  map("n", "<leader>q", ":lua vim.lsp.diagnostic.set_loclist()<cr>")
end

M.capabilities = cmp.update_capabilities(lsp.protocol.make_client_capabilities())

function M.makeConfig(config)
  return vim.tbl_deep_extend("force", {
    capabilities = M.capabilities,
    on_init = M.on_init,
    on_attach = M.on_attach,
  }, config or {})
end

return M
