return function()
  local lspconfig = require("lspconfig")
  local configs = require("lspconfig.configs")
  local make_config = require("malbernaz.lsp.utils").make_config

  local lsp = vim.lsp
  local fn = vim.fn

  -- customize diagnostics signs
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics,
    { signs = true, underline = true, virtual_text = false, update_in_insert = false }
  )

  if not configs.ls_emmet then
    configs.ls_emmet = {
      default_config = {
        cmd = { "ls_emmet", "--stdio" },
        filetypes = {
          "html",
          "css",
          "scss",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
        root_dir = function()
          return vim.loop.cwd()
        end,
        settings = {},
      },
    }
  end

  local servers = {
    "flow",
    "eslint",
    "cssls",
    "html",
    "graphql",
    "rust_analyzer",
    "ls_emmet",
    "prismals",
  }

  for _, server in ipairs(servers) do
    lspconfig[server].setup(make_config())
  end

  lspconfig.tsserver.setup(make_config({
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  }))

  lspconfig.sumneko_lua.setup(make_config({
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
      },
    },
  }))

  lspconfig.jsonls.setup(make_config({
    commands = {
      Format = {
        function()
          lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
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
          {
            fileMatch = {
              ".stylelintrc",
              ".stylelintrc.json",
              "stylelint.config.json",
            },
            url = "http://json.schemastore.org/stylelintrc.json",
          },
        },
      },
    },
  }))
end
