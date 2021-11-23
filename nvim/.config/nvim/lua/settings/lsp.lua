return function()
  local lsp = require("lspconfig")
  local cmp = require("cmp_nvim_lsp")
  local utils = require("utils")
  -- local configs = require("lspconfig/configs")

  -- customize lsp signs
  local signs = { Error = "", Warning = "", Hint = "", Information = "" }
  for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = false, signs = true, underline = true, update_in_insert = false }
  )

  local function on_attach()
    utils.set("omnifunc", "v:lua:vim.lsp.omnifunc")
    utils.map("n", "gD", ":lua vim.lsp.buf.declaration()<cr>")
    utils.map("n", "gd", ":lua vim.lsp.buf.definition()<cr>")
    utils.map("n", "K", ":lua vim.lsp.buf.hover()<cr>")
    utils.map("n", "gi", ":lua vim.lsp.buf.implementation()<cr>")
    utils.map("n", "<C-s>", ":lua vim.lsp.buf.signature_help()<cr>")
    utils.map("n", "<leader>wa", ":lua vim.lsp.buf.add_workspace_folder()<cr>")
    utils.map("n", "<leader>wr", ":lua vim.lsp.buf.remove_workspace_folder()<cr>")
    utils.map(
      "n",
      "<leader>wl",
      ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>"
    )
    utils.map("n", "<leader>D", ":lua vim.lsp.buf.type_definition()<cr>")
    utils.map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<cr>")
    utils.map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<cr>")
    utils.map("n", "gr", ":lua vim.lsp.buf.references()<cr>")
    utils.map("n", "<leader>e", ":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>")
    utils.map("n", "[d", ":lua vim.lsp.diagnostic.goto_prev()<cr>")
    utils.map("n", "]d", ":lua vim.lsp.diagnostic.goto_next()<cr>")
    utils.map("n", "<leader>q", ":lua vim.lsp.diagnostic.set_loclist()<cr>")
  end

  local function makeConfig(config)
    return vim.tbl_deep_extend("force", {
      capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      on_attach = on_attach,
    }, config or {})
  end

  lsp.tsserver.setup(makeConfig())
  lsp.eslint.setup(makeConfig())
  lsp.cssls.setup(makeConfig())
  lsp.html.setup(makeConfig())
  lsp.graphql.setup(makeConfig())

  -- configs.ls_emmet = {
  --   default_config = {
  --     cmd = { "ls_emmet", "--stdio" },
  --     filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "xml" },
  --     root_dir = function()
  --       return vim.loop.cwd()
  --     end,
  --     settings = {},
  --   },
  -- }
  -- lsp.ls_emmet.setup(makeConfig())

  local function configure_lua()
    USER = vim.fn.expand("$USER")

    local sumneko_root_path = ""
    local sumneko_binary = ""

    if vim.fn.has("mac") == 1 then
      sumneko_root_path = "/Users/" .. USER .. "/.config/nvim/lua-language-server"
      sumneko_binary = "/Users/"
        .. USER
        .. "/.config/nvim/lua-language-server/bin/macOS/lua-language-server"
    elseif vim.fn.has("unix") == 1 then
      sumneko_root_path = "/home/" .. USER .. "/.config/nvim/lua-language-server"
      sumneko_binary = "/home/"
        .. USER
        .. "/.config/nvim/lua-language-server/bin/Linux/lua-language-server"
    else
      print("Unsupported system for sumneko")
    end

    lsp.sumneko_lua.setup(makeConfig({
      cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          runtime = {
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
            },
          },
        },
        telemetry = {
          enable = false,
        },
      },
    }))
  end

  configure_lua()

  lsp.jsonls.setup(makeConfig({
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
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
