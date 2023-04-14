local lsp = require("lsp-zero")
local lspkind = require("lspkind")
local utils = require("malbernaz.utils")
local nmap = utils.nmap

lsp.preset({
  name = "recommended",
  manage_nvim_cmp = false,
})

lsp.ensure_installed({
  "lua_ls",
  "eslint",
  "tsserver",
  "jsonls",
})

lsp.set_preferences({
  sign_icons = {
    error = " ",
    warn = " ",
    hint = " ",
    info = " ",
  },
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }
  nmap("<leader>rn", vim.lsp.buf.rename, opts)
  nmap("<leader>ca", vim.lsp.buf.code_action, opts)
end)

lsp.configure("tsserver", {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
})

lsp.configure("jsonls", {
  settings = {
    json = {
      schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
        {
          fileMatch = { "tsconfig*.json" },
          url = "https://json.schemastore.org/tsconfig.json",
        },
        {
          fileMatch = {
            ".prettierrc",
            ".prettierrc.json",
            "prettier.config.json",
          },
          url = "https://json.schemastore.org/prettierrc.json",
        },
        {
          fileMatch = { ".eslintrc", ".eslintrc.json" },
          url = "https://json.schemastore.org/eslintrc.json",
        },
        {
          fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
          url = "https://json.schemastore.org/babelrc.json",
        },
        {
          fileMatch = { "lerna.json" },
          url = "https://json.schemastore.org/lerna.json",
        },
        {
          fileMatch = { "now.json", "vercel.json" },
          url = "https://json.schemastore.org/now.json",
        },
      },
    },
  },
})

lsp.nvim_workspace()

lsp.setup()

local lspconfig = require("lspconfig")

local function get_flow_cmd()
  local local_flow = vim.fn.getcwd() .. "/node_modules/.bin/flow"
  local cmd = vim.fn.filereadable(local_flow) > 0 and local_flow or "flow"

  return { cmd, "lsp" }
end

lspconfig.flow.setup({
  cmd = get_flow_cmd(),
  filetypes = { "javascript", "javascriptreact", "javascript.jsx" },
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  on_attach = function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_commands()
  end,
})

local cmp = require("cmp")
cmp.setup(lsp.defaults.cmp_config({
  preselect = "none",
  completion = {
    completeopt = "menu,menuone,noinsert,noselect",
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        path = "[PATH]",
        nvim_lsp = "[LSP]",
        buffer = "[BUFF]",
        luasnip = "[SNIP]",
        lua = "[API]",
      },
    }),
  },
  window = {
    documentation = {
      border = "none",
    },
  },
  experimental = {
    ghost_text = true,
  },
}))

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "none",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "none",
})

vim.diagnostic.config({
  float = { border = "none" },
})
