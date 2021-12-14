return function()
  local lspconfig = require("lspconfig")
  local cmp = require("cmp_nvim_lsp")
  local utils = require("utils")

  local lsp = vim.lsp
  local fn = vim.fn
  local map = utils.map
  local set = utils.set

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

  local function on_attach()
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

  local function makeConfig(config)
    local capabilities = cmp.update_capabilities(lsp.protocol.make_client_capabilities())

    return vim.tbl_deep_extend("force", {
      capabilities = capabilities,
      on_attach = on_attach,
    }, config or {})
  end

  lspconfig.tsserver.setup(makeConfig())
  lspconfig.eslint.setup(makeConfig())
  lspconfig.cssls.setup(makeConfig())
  lspconfig.html.setup(makeConfig())
  lspconfig.graphql.setup(makeConfig())

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
