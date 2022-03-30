return function()
  local utils = require("malbernaz.utils")

  local prettier = function()
    return {
      exe = "prettier",
      args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
      stdin = true,
    }
  end

  local stylua = function()
    return {
      exe = "stylua",
      stdin = false,
    }
  end

  require("formatter").setup({
    logging = false,
    filetype = {
      javascript = { prettier },
      typescript = { prettier },
      typescriptreact = { prettier },
      javascriptreact = { prettier },
      json = { prettier },
      html = { prettier },
      css = { prettier },
      scss = { prettier },
      graphql = { prettier },
      markdown = { prettier },
      ["markdown.mdx"] = { prettier },
      vue = { prettier },
      lua = { stylua },
    },
  })

  -- mappings
  utils.map("n", "<leader>f", ":FormatWrite<cr>")

  utils.create_cmdgroup({
    name = "FormatGroup",
    event = "BufWritePost",
    pattern = {
      "*.js",
      "*.jsx",
      "*.ts",
      "*.tsx",
      "*.json",
      "*.vue",
      "*.html",
      "*.css",
      "*.scss",
      "*.md",
      "*.mdx",
      "*.graphql",
      "*.gql",
      "*.lua",
    },
    command = "FormatWrite",
  })
end
