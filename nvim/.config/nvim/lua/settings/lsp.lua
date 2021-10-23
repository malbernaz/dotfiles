return function()
  local lsp = require("lspconfig")
  local cmp = require("cmp_nvim_lsp")
  local utils = require("utils")

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

    lsp.sumneko_lua.setup({
      cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
      capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      on_attach = on_attach,
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
    })
  end

  configure_lua()

  lsp.tsserver.setup({
    capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach,
  })

  lsp.jsonls.setup({
    capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach,
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
        end,
      },
    },
  })

  lsp.eslint.setup({
    capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach,
  })

  lsp.cssls.setup({
    capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach,
  })

  lsp.html.setup({
    capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach,
  })

  lsp.graphql.setup({
    capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach,
  })
end
