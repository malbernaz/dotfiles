return function()
  local lsp = require("lspconfig")
  local cmp = require("cmp")
  local lspinstall = require("lspinstall")

  -- general settings
  vim.api.nvim_set_option("completeopt", "menuone,noinsert,noselect")
  vim.o.shortmess = vim.o.shortmess .. "c"
  vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }
  vim.g.completion_trigger_keyword_length = 3

  -- customize lsp signs
  local signs = { Error = "", Warning = "", Hint = "", Information = "" }
  for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  local function setup_servers()
    lspinstall.setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.colorProvider = { dynamicRegistration = false }
    local config = {
      capabilities = capabilities,
      on_attach = cmp.on_attach,
    }

    local servers = lspinstall.installed_servers()
    for _, server in pairs(servers) do
      if server == "lua" then
        config.settings = {
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
        }
      end

      lsp[server].setup(config)
    end
  end

  setup_servers()

  -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
  lspinstall.post_install_hook = function()
    setup_servers()
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
  end
end
