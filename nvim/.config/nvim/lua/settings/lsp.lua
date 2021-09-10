return function()
  local lsp = require("lspconfig")
  local cmp = require("completion")

  vim.api.nvim_set_option("completeopt", "menuone,noinsert,noselect")
  vim.o.shortmess = vim.o.shortmess .. "c"
  vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }
  vim.g.completion_trigger_keyword_length = 3

  -- tsserver
  lsp.tsserver.setup({
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    init_options = {
      hostInfo = "neovim",
    },
    root_dir = lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    on_attach = cmp.on_attach,
  })

  -- lua
  local sumneko_root_path = "/usr/share/lua-language-server"
  local sumneko_binary = "/usr/bin/lua-language-server"
  lsp.sumneko_lua.setup({
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
    },
    on_attach = cmp.on_attach,
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }

  -- css
  require("lspconfig").cssls.setup({
    capabilities = capabilities,
    settings = {
      scss = {
        lint = {
          idSelector = "warning",
          zeroUnits = "warning",
          duplicateProperties = "warning",
        },
        completion = {
          completePropertyWithSemicolon = true,
          triggerPropertyValueCompletion = true,
        },
      },
    },
    on_attach = cmp.on_attach,
  })

  -- html
  require("lspconfig").html.setup({
    capabilities = capabilities,
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true,
      },
    },
    on_attach = cmp.on_attach,
  })

  -- json
  require("lspconfig").jsonls.setup({
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
        end,
      },
    },
    capabilities = capabilities,
    on_attach = cmp.on_attach,
  })

  -- vue
  require("lspconfig").vuels.setup({
    cmd = { "vls" },
    filetypes = { "vue" },
    init_options = {
      config = {
        css = {},
        emmet = {},
        html = {
          suggest = {},
        },
        javascript = {
          format = {},
        },
        stylusSupremacy = {},
        typescript = {
          format = {},
        },
        vetur = {
          completion = {
            autoImport = false,
            tagCasing = "kebab",
            useScaffoldSnippets = false,
          },
          format = {
            defaultFormatter = {
              js = "none",
              ts = "none",
            },
            defaultFormatterOptions = {},
            scriptInitialIndent = false,
            styleInitialIndent = false,
          },
          useWorkspaceDependencies = false,
          validation = {
            script = true,
            style = true,
            template = true,
          },
        },
      },
    },
    root_dir = lsp.util.root_pattern("package.json", "vue.config.js"),
    on_attach = cmp.on_attach,
  })

  -- customize lsp signs
  local signs = { Error = "", Warning = "", Hint = "", Information = "" }

  for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end
