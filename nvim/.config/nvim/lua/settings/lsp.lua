return function()
  local lsp = require("lspconfig")
  local lsputil = require("lspconfig/util")
  local cmp = require("cmp_nvim_lsp")
  local lspinstall = require("lspinstall")
  local utils = require("utils")

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

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = false,
      signs = true,
      underline = true,
      update_in_insert = false,
    }
  )

  local function on_attach()
    utils.set("omnifunc", "v:lua:vim.lsp.omnifunc")
    utils.map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
    utils.map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    utils.map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    utils.map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    utils.map("n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    utils.map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
    utils.map("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
    utils.map(
      "n",
      "<leader>wl",
      "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>"
    )
    utils.map("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
    utils.map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    utils.map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    utils.map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
    utils.map("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
    utils.map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
    utils.map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
    utils.map("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
    utils.map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  end

  local function setup_servers()
    lspinstall.setup()

    local config = {
      capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      on_attach = on_attach,
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
        config.filetypes = { "lua" }
      elseif server == "graphql" then
        config.filetypes = {
          "graphql",
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        }
        config.root_dir = lsputil.root_pattern(".git", ".graphqlrc*", ".graphql.config.*")
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
