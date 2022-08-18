return function()
  local lspconfig = require("lspconfig")
  local make_config = require("malbernaz.lsp.utils").make_config

  local servers = {
    flow = {},
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
      filetypes = {
        "html",
        "css",
      },
    },
    tsserver = {
      filetypes = {
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
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
      commands = {
        Format = {
          function()
            vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
          end,
        },
      },
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
end
