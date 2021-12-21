return function()
  local lspconfig = require("lspconfig")
  local makeConfig = require("malbernaz.lsp.utils").makeConfig

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
    { signs = true, virtual_text = false, underline = false, update_in_insert = false }
  )

  lspconfig.tsserver.setup(makeConfig())
  lspconfig.eslint.setup(makeConfig())
  lspconfig.cssls.setup(makeConfig())
  lspconfig.html.setup(makeConfig())
  lspconfig.graphql.setup(makeConfig())
  lspconfig.rust_analyzer.setup(makeConfig())

  local root = fn.stdpath("config") .. "/lua-language-server"
  local os = vim.fn.has("mac") == 1 and "/bin/macOS" or "/bin/Linux"
  local bin = root .. os .. "/lua-language-server"
  require("nlua.lsp.nvim").setup(
    lspconfig,
    makeConfig({ cmd = { bin, "-E", root .. "/main.lua" } })
  )

  lspconfig.jsonls.setup(makeConfig({
    commands = {
      Format = {
        function()
          lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
        end,
      },
    },
    settings = {
      json = {
        -- Schemas https://www.schemastore.org
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
