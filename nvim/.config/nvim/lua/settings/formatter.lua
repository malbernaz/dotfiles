return function()
  local prettier = function()
    return {
      exe = "./node_modules/.bin/prettier",
      args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--double-quote" },
      stdin = true,
    }
  end

  require("formatter").setup({
    logging = false,
    filetype = {
      javascript = { prettier },
      typescript = { prettier },
      html = { prettier },
      css = { prettier },
      scss = { prettier },
      markdown = { prettier },
      vue = { prettier },
      lua = {
        -- Stylua
        function()
          return {
            exe = "~/.cargo/bin/stylua",
            stdin = false,
          }
        end,
      },
    },
  })

  vim.api.nvim_exec(
    [[
      augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.vue,*.html,*.css,*.scss,*.rs,*.lua FormatWrite
      augroup END
    ]],
    true
  )
end
