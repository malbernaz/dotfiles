return function()
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
      vue = { prettier },
      lua = { stylua },
    },
  })

  vim.api.nvim_exec(
    [[
      augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.json,*.vue,*.html,*.css,*.scss,*.md,*.graphql,*.gql,*.lua FormatWrite
      augroup END
    ]],
    true
  )
end
