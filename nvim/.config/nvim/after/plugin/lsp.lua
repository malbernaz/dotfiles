local lspconfig = require("lspconfig")
local make_config = require("malbernaz.lsp.utils").make_config

local function flow_cmd()
  local local_flow = vim.fn.getcwd() .. "/node_modules/.bin/flow"
  local cmd = vim.fn.filereadable(local_flow) > 0 and local_flow or "npx --no-install flow"

  return { cmd, "lsp" }
end

local servers = {
  flow = {
    cmd = flow_cmd(),
  },
  eslint = {},
  cssls = {},
  cssmodules_ls = {},
  html = {},
  graphql = {},
  rust_analyzer = {},
  vimls = {},
  svelte = {},
  prismals = {},
  emmet_ls = {
    filetypes = { "html", "css" },
  },
  tsserver = {
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  },
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
      },
    },
  },
  jsonls = {
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
  },
}

for server, config in pairs(servers) do
  lspconfig[server].setup(make_config(config))
end
