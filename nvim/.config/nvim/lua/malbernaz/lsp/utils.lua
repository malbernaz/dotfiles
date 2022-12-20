local cmp = require("cmp_nvim_lsp")
local nmap = require("malbernaz.utils").nmap

-- customize diagnostics signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  { signs = true, underline = true, virtual_text = false, update_in_insert = false }
)

nmap("<leader>e", vim.diagnostic.open_float)
nmap("[d", vim.diagnostic.goto_prev)
nmap("]d", vim.diagnostic.goto_next)
nmap("<leader>q", vim.diagnostic.setloclist)

local function on_init(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local function on_attach(_, buffer)
  vim.bo[buffer].omnifunc = "v:lua:vim.lsp.omnifunc"

  local opts = { buffer = buffer }

  nmap("gD", vim.lsp.buf.declaration, opts)
  nmap("gd", vim.lsp.buf.definition, opts)
  nmap("K", vim.lsp.buf.hover, opts)
  nmap("gi", vim.lsp.buf.implementation, opts)
  nmap("<c-s>", vim.lsp.buf.signature_help, opts)
  nmap("<space>wa", vim.lsp.buf.add_workspace_folder, opts)
  nmap("<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
  nmap("<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  nmap("<space>D", vim.lsp.buf.type_definition, opts)
  nmap("<space>rn", vim.lsp.buf.rename, opts)
  nmap("<space>ca", vim.lsp.buf.code_action, opts)
  nmap("gr", vim.lsp.buf.references, opts)
  -- nmap("<space>f", function()
  --   vim.lsp.buf.format({ async = true })
  -- end, opts)
end

local capabilities = cmp.default_capabilities()

local M = {}

function M.make_config(config)
  return vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    on_init = on_init,
    on_attach = on_attach,
  }, config or {})
end

return M
